resource "google_certificate_manager_certificate_map" "this" {
  name        = var.certificate_map_name
  description = var.certificate_map_description
  labels      = var.labels
  project     = var.project_id
}

resource "google_certificate_manager_certificate_map_entry" "primary" {
  for_each     = var.primary_certificates
  name         = each.key
  map          = google_certificate_manager_certificate_map.this.name
  matcher      = "PRIMARY"
  certificates = [for c in var.primary_certificates : contains(keys(google_certificate_manager_certificate.this), c) ? google_certificate_manager_certificate.this[c].id : c]
}

resource "google_certificate_manager_certificate_map_entry" "this" {
  for_each     = local.entries
  name         = lower(replace(replace("${substr(replace("${var.certificate_map_name}-${each.key}", "*", "star"), 0, 57)}-${substr(base64sha512(each.key), 0, 5)}", "/--+/", "-"), "/[^a-zA-Z0-9-]/", "-"))
  map          = google_certificate_manager_certificate_map.this.name
  certificates = [for c in each.value.certificates : contains(keys(google_certificate_manager_certificate.this), c) ? google_certificate_manager_certificate.this[c].id : c]
  hostname     = each.value.hostname
}

resource "google_certificate_manager_certificate" "this" {
  for_each = var.certificates
  name     = lower(replace(replace("${substr(replace("${var.certificate_map_name}-${each.key}", "*", "star"), 0, 57)}-${substr(base64sha512(each.key), 0, 5)}", "/--+/", "-"), "/[^a-zA-Z0-9-]/", "-"))
  labels   = merge(var.labels, each.value.labels)
  scope    = each.value.scope
  dynamic "managed" {
    for_each = each.value.managed == null ? [] : [each.value.managed]
    content {
      domains            = managed.value.domains
      dns_authorizations = [for a in managed.value.dns_authorizations : contains(keys(google_certificate_manager_dns_authorization.this), a) ? google_certificate_manager_dns_authorization.this[a].id : a]
    }
  }
}

resource "google_certificate_manager_dns_authorization" "this" {
  for_each = var.dns_authorizations
  name     = lower(replace(replace("${substr(replace("${var.certificate_map_description}-${each.key}", "*", "star"), 0, 57)}-${substr(base64sha512(each.key), 0, 5)}", "/--+/", "-"), "/[^a-zA-Z0-9-]/", "-"))
  domain   = each.value.domain
}

output "dns_records" {
  value = { for k, v in google_certificate_manager_dns_authorization.this : k => v.dns_resource_record }
}

output "dns_records_list" {
  value = flatten([for k, v in google_certificate_manager_dns_authorization.this : v.dns_resource_record])
}

output "certificate_authorization_attempt_info" {
  value = { for k, v in google_certificate_manager_certificate.this : k => one(v.managed).authorization_attempt_info if length(v.managed) == 1 }
}

output "certificate_provisioning_issue" {
  value = { for k, v in google_certificate_manager_certificate.this : k => one(v.managed).provisioning_issue if length(v.managed) == 1 }
}

output "certificate_state" {
  value = { for k, v in google_certificate_manager_certificate.this : k => one(v.managed).state if length(v.managed) == 1 }
}

output "primary_entry_state" {
  value = try(google_certificate_manager_certificate_map_entry.primary[0].state, null)
}

output "certificate_ids" {
  value = { for k, v in google_certificate_manager_certificate.this : k => v.id }
}

output "dns_authorization_ids" {
  value = { for k, v in google_certificate_manager_dns_authorization.this : k => v.id }
}

output "certificate_map_name" {
  value = google_certificate_manager_certificate_map.this.name
}

output "certificate_map_id" {
  value = google_certificate_manager_certificate_map.this.id
}


locals {
  auto_entries = merge([
    for k, v in var.certificates : {
      for d in v.managed.domains : "${k}-${d}" => { hostname = d, certificates = [k] }
    } if v.managed != null && v.managed.create_entries == true
  ]...)
  entries = merge(local.auto_entries, var.entries)
}


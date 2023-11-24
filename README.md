# terraform-google-certificate-manager

Terraform module to create GCP Certificate Manager Certificates and its configuration.

## Usage

**IMPORTANT**: We do not pin modules to versions in our examples because of the
difficulty of keeping the versions in the documentation in sync with the latest released versions.
We highly recommend that in your code you pin the version to the exact version you are
using so that your infrastructure remains stable, and update versions in a
systematic way so that they do not catch you by surprise.

```hcl
module "certificate_manager" {
  source = "../../"

  project_id = data.google_project.this.project_id

  certificate_map_name        = "terratest"
  certificate_map_description = "A certificate map for testing purposes"
  certificates = {
    mgmt = {
      managed = {
        domains = [
          "test.example.com"
        ]
        dns_authorizations = []
      }
    }
  }

  primary_certificates = ["mgmt"]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_certificate_manager_certificate.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate) | resource |
| [google_certificate_manager_certificate_map.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map) | resource |
| [google_certificate_manager_certificate_map_entry.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry) | resource |
| [google_certificate_manager_certificate_map_entry.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry) | resource |
| [google_certificate_manager_dns_authorization.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_dns_authorization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_map_description"></a> [certificate\_map\_description](#input\_certificate\_map\_description) | A human-readable description of the resource. | `string` | `null` | no |
| <a name="input_certificate_map_name"></a> [certificate\_map\_name](#input\_certificate\_map\_name) | A user-defined name of the Certificate Map. Certificate Map names must be unique globally and match the pattern 'projects/*/locations/*/certificateMaps/*' | `string` | n/a | yes |
| <a name="input_certificates"></a> [certificates](#input\_certificates) | n/a | <pre>map(object({<br>    description = optional(string)<br>    scope       = optional(string)<br>    labels      = optional(map(string))<br>    managed = optional(object({<br>      domains            = set(string)<br>      dns_authorizations = optional(set(string))<br>      create_entries     = optional(bool)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_dns_authorizations"></a> [dns\_authorizations](#input\_dns\_authorizations) | n/a | <pre>map(object({<br>    domain      = string<br>    description = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_entries"></a> [entries](#input\_entries) | n/a | <pre>map(object({<br>    labels       = optional(map(string))<br>    hostname     = string<br>    certificates = set(string)<br>  }))</pre> | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Set of labels associated with a Certificate Map resource. | `map(string)` | `null` | no |
| <a name="input_primary_certificates"></a> [primary\_certificates](#input\_primary\_certificates) | n/a | `set(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_certificate_manager_certificate.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate) | resource |
| [google_certificate_manager_certificate_map.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map) | resource |
| [google_certificate_manager_certificate_map_entry.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry) | resource |
| [google_certificate_manager_certificate_map_entry.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry) | resource |
| [google_certificate_manager_dns_authorization.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_dns_authorization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_map_description"></a> [certificate\_map\_description](#input\_certificate\_map\_description) | A human-readable description of the resource. | `string` | `null` | no |
| <a name="input_certificate_map_name"></a> [certificate\_map\_name](#input\_certificate\_map\_name) | A user-defined name of the Certificate Map. Certificate Map names must be unique globally and match the pattern 'projects/*/locations/*/certificateMaps/*' | `string` | n/a | yes |
| <a name="input_certificates"></a> [certificates](#input\_certificates) | n/a | <pre>map(object({<br>    description = optional(string)<br>    scope       = optional(string)<br>    labels      = optional(map(string))<br>    managed = optional(object({<br>      domains            = set(string)<br>      dns_authorizations = optional(set(string))<br>      create_entries     = optional(bool)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_dns_authorizations"></a> [dns\_authorizations](#input\_dns\_authorizations) | n/a | <pre>map(object({<br>    domain      = string<br>    description = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_entries"></a> [entries](#input\_entries) | n/a | <pre>map(object({<br>    labels       = optional(map(string))<br>    hostname     = string<br>    certificates = set(string)<br>  }))</pre> | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Set of labels associated with a Certificate Map resource. | `map(string)` | `null` | no |
| <a name="input_primary_certificates"></a> [primary\_certificates](#input\_primary\_certificates) | n/a | `set(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authorization_attempt_info"></a> [certificate\_authorization\_attempt\_info](#output\_certificate\_authorization\_attempt\_info) | n/a |
| <a name="output_certificate_ids"></a> [certificate\_ids](#output\_certificate\_ids) | n/a |
| <a name="output_certificate_map_id"></a> [certificate\_map\_id](#output\_certificate\_map\_id) | n/a |
| <a name="output_certificate_map_name"></a> [certificate\_map\_name](#output\_certificate\_map\_name) | n/a |
| <a name="output_certificate_provisioning_issue"></a> [certificate\_provisioning\_issue](#output\_certificate\_provisioning\_issue) | n/a |
| <a name="output_certificate_state"></a> [certificate\_state](#output\_certificate\_state) | n/a |
| <a name="output_dns_authorization_ids"></a> [dns\_authorization\_ids](#output\_dns\_authorization\_ids) | n/a |
| <a name="output_dns_records"></a> [dns\_records](#output\_dns\_records) | n/a |
| <a name="output_dns_records_list"></a> [dns\_records\_list](#output\_dns\_records\_list) | n/a |
| <a name="output_primary_entry_state"></a> [primary\_entry\_state](#output\_primary\_entry\_state) | n/a |
<!-- END_TF_DOCS -->
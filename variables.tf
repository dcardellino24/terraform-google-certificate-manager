variable "certificate_map_name" {
  type        = string
  description = "A user-defined name of the Certificate Map. Certificate Map names must be unique globally and match the pattern 'projects/*/locations/*/certificateMaps/*'"
}

variable "certificate_map_description" {
  type        = string
  default     = null
  description = "A human-readable description of the resource."
}

variable "labels" {
  type        = map(string)
  default     = null
  description = "Set of labels associated with a Certificate Map resource."
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "entries" {
  type = map(object({
    labels       = optional(map(string))
    hostname     = string
    certificates = set(string)
  }))
  default = {}
}

variable "certificates" {
  type = map(object({
    description = optional(string)
    scope       = optional(string)
    labels      = optional(map(string))
    managed = optional(object({
      domains            = set(string)
      dns_authorizations = optional(set(string))
      create_entries     = optional(bool)
    }))
  }))
}

variable "primary_certificates" {
  type = set(string)
}

variable "dns_authorizations" {
  type = map(object({
    domain      = string
    description = optional(string)
  }))
  default = {}
}


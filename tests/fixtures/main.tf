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


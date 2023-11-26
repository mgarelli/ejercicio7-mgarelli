variable "project_id" {}
variable "endpoints_service_name" {}

resource "google_endpoints_service" "endpoints_service" {
  project = var.project_id
  service_name  = var.endpoints_service_name
  

}

output "host" {
  value = google_endpoints_service.endpoints_service.service_name
}
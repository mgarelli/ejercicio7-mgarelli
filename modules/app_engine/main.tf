variable "project_id" {}
variable "service_name" {}
variable "endpoints_host" {}

resource "google_app_engine_application" "app_engine" {
  project      = var.project_id
  location_id    = "us-central"

  
}

resource "google_app_engine_standard_app_version" "app_version" {
  project      = var.project_id
  service      = var.service_name
  version_id   = "v1"
  runtime      = "python39"

  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }

  env_variables = {
    ENDPOINTS_SERVICE_NAME = var.endpoints_host
  }

  deployment {
    zip {
      source_url = "https://github.com/mgarelli/flask-hello-world"
    }
  }
}
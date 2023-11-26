provider "google" {
  credentials = file("/root/.config/gcloud/application_default_credentials.json")
  project     = "ejercicio7"
  region      = "us-central1" 
}


module "endpoints" {
  source                 = "./modules/endpoints"
  project_id             = "ejercicio7"
  endpoints_service_name = "endpoints_service"
}

module "app_engine" {
  source             = "./modules/app_engine"
  project_id         = "ejercicio7"
  service_name       = "app_engine"
  endpoints_host     = module.endpoints.host
}
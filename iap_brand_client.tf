resource "google_project_service" "project_service" {
  project = data.google_project.self.project_id
  service = "iap.googleapis.com"
}

resource "google_iap_brand" "project_brand" {
  support_email     = "support@example.com"
  application_title = "Cloud IAP protected Application"
  project           = google_project_service.project_service.project
}

resource "google_iap_client" "project_client" {
  display_name = "IAPtestAPP"
  brand        =  google_iap_brand.project_brand.name
}

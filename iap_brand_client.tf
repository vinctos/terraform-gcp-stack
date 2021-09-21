resource "google_project_service" "project_service" {
  project = data.google_project.self.project_id
  service = "iap.googleapis.com"
}

resource "google_iap_brand" "project_brand" {
  support_email     = "vinayak439@gmail.com"
  application_title = "Cloud IAP protected Application"
  project           = data.google_project.self.project_id
  depends_on = [google_project_service.project_service]
}

resource "google_iap_client" "project_client" {
  display_name = "IAPtestAPP"
  brand        =  google_iap_brand.project_brand.name
  depends_on = [google_iap_brand.project_brand]
}

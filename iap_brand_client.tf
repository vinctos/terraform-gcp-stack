# resource "google_project_service" "project_service" {
#   project = data.google_project.self.project_id
#   service = "iap.googleapis.com"
# }

# resource "google_iap_brand" "project_brand" {
#   support_email     = "terraform@vc-fallen-devint.iam.gserviceaccount.com"
#   application_title = "Cloud IAP protected Application"
# }

# resource "google_iap_client" "project_client" {
#   display_name = "IAPtestAPP"
#   brand        =  "projects/475917491527/brands/475917491527"
# }

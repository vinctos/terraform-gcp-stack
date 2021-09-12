resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-${var.environment}"
  display_name = "Service Account for terraform cloud in ${var.environment}"
  project = data.google_project.self.project_id
}

resource "google_service_account_iam_member" "admin-account-iam" {
  service_account_id = google_service_account.terraform_sa.name
  role               = "roles/owner"
  member             = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_binding" "rahulproj" {
  count = var.environment == "devint" ? 1 : 0
  role   = "roles/viewer"
  members = [
    "user:rahulg1333@gmail.com",
  ]
}

resource "google_project_iam_member" "rahulbq" {
  count = var.environment == "devint" ? 1 : 0
  role   = "roles/bigquery.admin"
  member = "user:rahulg1333@gmail.com"
  depends_on = [google_project_iam_member.rahulproj]
}

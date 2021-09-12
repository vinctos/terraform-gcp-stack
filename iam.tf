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

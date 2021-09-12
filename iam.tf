resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-${var.environment}"
  display_name = "Service Account for terraform cloud in ${var.environment}"
  project = data.google_project.self.project_id
}

data "google_service_account" "terraform-env" {
  account_id = "projects/${data.google_project.self.project_id}/serviceaccounts/terraform-${var.environment}@${data.google_project.self.project_id}.iam.gserviceaccount.com"
  project = data.google_project.self.project_id
}

resource "google_service_account_iam_member" "owner-account-iam" {
  service_account_id = data.google_service_account.terraform-env.account_id
  role               = "roles/owner"
  member             = "serviceAccount:${data.google_service_account.terraform-env.email}"
}

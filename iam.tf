resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-${var.environment}"
  display_name = "Service Account for terraform cloud in ${var.environment}"
}

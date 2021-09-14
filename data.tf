data "google_project" "self" {
}

data "google_client_config" "current" {
}

data "google_service_account" "object_viewer" {
  account_id = "projects/vc-fallen-${var.environment}/serviceaccounts/terraform-${var.environment}@vc-fallen-${var.environment}.iam.gserviceaccount.com"
}

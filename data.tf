data "google_project" "self" {
}

data "google_client_config" "current" {
}

data "google_service_account" "vc-fallen-sa" {
  account_id = "projects/vc-fallen-${var.environment}/serviceaccounts/terraform-${var.environment}@vc-fallen-${var.environment}.iam.gserviceaccount.com"
}

data "google_compute_address" "test_addr" {
  name = "test-disk"
}

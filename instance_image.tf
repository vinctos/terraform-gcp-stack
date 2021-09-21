resource "google_compute_instance_from_machine_image" "tpl" {
  count = var.environment == "devint" ? 1: 0
  provider = google-beta
  name     = "instance-from-machine-image"
  zone     = "us-central1-a"

  source_machine_image = "projects/vc-fallen-${var.environment}/global/machineImages/sad-image"
}

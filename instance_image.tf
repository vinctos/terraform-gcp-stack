resource "google_compute_instance_from_machine_image" "tpl" {
  provider = google-beta
  name     = "instance-from-machine-image"
  zone     = "us-central1-a"

  source_machine_image = "projects/vc-fallen-${var.environment}/global/machineImages/sad-image"
  machine_type = "n1-standard-1"
}

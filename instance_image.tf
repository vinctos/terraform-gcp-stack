# resource "google_compute_instance_from_machine_image" "tpl" {
#   provider = google-beta
#   name     = "instance-from-machine-image"
#   zone     = "us-central1-a"

#   source_machine_image = "projects/vc-fallen-${var.environment}/zones/us-central1-a/machineImages/sad-image"
# }

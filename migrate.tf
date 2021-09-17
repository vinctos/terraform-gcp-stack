resource "google_compute_instance" "test_disk_tf" {
  name         = "fallen-diff-tf"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  project = "vc-fallen-devint"

  tags = ["vinayak", "fallen"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      type = "pd-standard"
      size = "10"
    }
  }

  network_interface {
    network = "default"
    network_ip = "10.128.0.101"
    access_config {
    }
  }

  metadata = {
    process = "fallenserver"
  }

  metadata_startup_script = "sudo apt update"

  service_account {
    email  = "terraform-devint@vc-fallen-devint.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

}

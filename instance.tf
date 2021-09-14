resource "google_compute_address" "static" {
  name = "test-disk"
  count = var.environment == "devint" ? 1: 0
}

resource "google_compute_instance" "test-disk" {
  count = var.environment == "devint" ? 1: 0
  name         = "fallen"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["vinayak", "fallen"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"
    network_ip = "10.128.0.10"
    access_config {
       nat_ip = data.google_compute_address.test_addr.address
    }

  metadata = {
    process = "fallenserver"
  }

  metadata_startup_script = "sudo apt update"

  service_account {
    email  = data.google_service_account.vc-fallen-sa.email
    scopes = ["cloud-platform"]
  }
  depends_on = [google_compute_address.static]
}

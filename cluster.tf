
resource "google_container_cluster" "devintcluster" {
  name     = "my-gke-cluster"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  count = var.environment == "devint" ? 1: 0
}

resource "google_container_node_pool" "devint_preemptible_nodes" {
  name       = "test-node-pool"
  location   = "n1-standard-1"
  cluster    = "${element(google_container_cluster.devintcluster.*.name, count.index)}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

      service_account {
    email  = data.google_service_account.vc-fallen-sa.email
    scopes = ["cloud-platform"]
  }
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  depends_on = [google_container_cluster.devintcluster]
  count = var.environment == "devint" ? 1: 0
}

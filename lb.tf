module "gce-lb-http" {
  count = var.environment == "devint" ? 1: 0
  source            = "GoogleCloudPlatform/lb-http/google"
  version           = "~> 4.4"

  project           = data.google_project.self.project_id
  name              = "group-http-lb"
  target_tags       = ["fallen"]
  backends = {
    default = {
      description                     = null
      protocol                        = "HTTPS"
      port                            = "3000"
      port_name                       = "http"
      timeout_sec                     = 10
      enable_cdn                      = false
      custom_request_headers          = null
      custom_response_headers         = null
      security_policy                 = null

      connection_draining_timeout_sec = null
      session_affinity                = null
      affinity_cookie_ttl_sec         = null

      health_check = {
        check_interval_sec  = null
        timeout_sec         = null
        healthy_threshold   = null
        unhealthy_threshold = null
        request_path        = "/"
        port                = "3000"
        host                = null
        logging             = null
      }

      log_config = {
        enable = true
        sample_rate = 1.0
      }

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}

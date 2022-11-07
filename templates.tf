resource "sigsci_site_templated_rule" "login_attempt" {
  site_short_name = var.sigsci_site
  name            = "LOGINATTEMPT"
  detections {
    enabled = "true"
    fields {
      name  = "path"
      value = "/auth/v2/oath/token"
    }
  }

  alerts {
    long_name          = "alert 1"
    interval           = 1
    threshold          = 10
    skip_notifications = true
    enabled            = true
    action             = "info"
    block_duration_seconds = 600
  }

}

resource "sigsci_site_templated_rule" "login_failure" {
  site_short_name = var.sigsci_site
  name            = "LOGINFAILURE"
  detections {
    enabled = "true"
    fields {
      name  = "path"
      value = "/auth/v2/oath/token"
    }
    fields {
      name  = "responseCode"
      value = "400"
    }
    fields {
      name  = "responseHeaderName"
      value = ""
    }
    fields {
      name  = "responseHeaderValue"
      value = ""
    }
  }
  alerts {
    long_name          = "alert 1"
    interval           = 1
    threshold          = 10
    skip_notifications = true
    enabled            = true
    action             = "info"
    block_duration_seconds = 600
  }
}

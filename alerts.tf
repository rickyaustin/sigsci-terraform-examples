resource "sigsci_site_alert" "test" {
  site_short_name    = "gcp_lab"
  tag_name           = sigsci_site_signal_tag.testalert.id
  long_name          = "Test Alert"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "XSS" {
  site_short_name    = "gcp_lab"
  tag_name           = "XSS"
  long_name          = "XSS Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "SQLI" {
  site_short_name    = "gcp_lab"
  tag_name           = "SQLI"
  long_name          = "SQLI Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "CMDEXE" {
  site_short_name    = "gcp_lab"
  tag_name           = "CMDEXE"
  long_name          = "CMD Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}
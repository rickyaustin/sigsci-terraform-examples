resource "sigsci_site_alert" "XSS" {
  site_short_name    = var.sigsci_site
  tag_name           = "XSS"
  long_name          = "XSS Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "SQLI" {
  site_short_name    = var.sigsci_site
  tag_name           = "SQLI"
  long_name          = "SQLI Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "CMDEXE" {
  site_short_name    = var.sigsci_site
  tag_name           = "CMDEXE"
  long_name          = "CMD Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "TRAVERSAL" {
  site_short_name    = var.sigsci_site
  tag_name           = "TRAVERSAL"
  long_name          = "Traversal Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "BACKDOOR" {
  site_short_name    = var.sigsci_site
  tag_name           = "BACKDOOR"
  long_name          = "Backdoor Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

resource "sigsci_site_alert" "USERAGENT" {
  site_short_name    = var.sigsci_site
  tag_name           = "USERAGENT"
  long_name          = "Attack Tooling Threshold"
  interval           = 1
  threshold          = 10
  enabled            = true
  action             = "flagged"
  skip_notifications = true
}

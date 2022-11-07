resource "sigsci_site_rule" "invalid-host-header" {
  site_short_name = var.sigsci_site
  type            = "request"
  group_operator  = "any"
  enabled         = true
  reason          = "Invalid host header was provided"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.domain-request
  ]

  conditions {
    type     = "single"
    field    = "domain"
    operator = "equals"
    value    = "example.com"
  }

  conditions {
    type     = "single"
    field    = "domain"
    operator = "like"
    value    = "*.example.com"
  }

  actions {
    type = "addSignal"
    signal = "site.domain-request" 
  }

}

resource "sigsci_site_rule" "bad-agent" {
  site_short_name = var.sigsci_site
  type            = "request"
  group_operator  = "all"
  enabled         = true
  reason          = "Suspicious UserAgent"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.bad-agent,
    sigsci_site_list.bad-user-agents
  ]

  conditions {
    type     = "single"
    field    = "useragent"
    operator = "inList"
    value    = "site.bad-user-agents"
  }

  actions {
    type = "block"
    signal = "site.bad-user-agents" 
  }

}

resource "sigsci_site_rule" "ofac" {
  site_short_name = var.sigsci_site
  type            = "request"
  group_operator  = "all"
  enabled         = true
  reason          = "Country is in OFAC list"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.ofac,
    sigsci_site_list.ofac
  ]

  conditions {
    type     = "single"
    field    = "country"
    operator = "inList"
    value    = "site.ofac-countries"
  }

  actions {
    type = "block"
    signal = "site.ofac" 
  }

}

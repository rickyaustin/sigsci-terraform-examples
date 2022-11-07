/*resource "sigsci_site_rule" "Bot_Challenge_Login" {
  site_short_name = var.sigsci_site
  type            = "rateLimit"
  group_operator  = "all"
  enabled         = true
  reason          = "Bot Challenge Login/PW Reset - Web (Stage)"
  signal          = "site.loginpwdreset"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.loginpwdreset
    ]

  conditions {
      type     = "single"
      field    = "domain"
      operator = "equals"
      value    = "www.example.com"
  }

  conditions {
    group_operator = "any"
    type = "multival"
    conditions {
        field = "path"
        operator = "equals"
        type = "single"
        value = "/login"
    }
    conditions {
        field = "path"
        operator = "equals"
        type = "single"
        value = "/password-reset"
    }
    conditions {
        field = "path"
        operator = "equals"
        type = "single"
        value = "/signup"
    }
  }
  rate_limit = {
    duration  = 3600
    interval  = 10
    threshold = 10
  }
  actions {
    response_code = 406
    signal        = "site.loginpwdreset"
    type          = "blockSignal"
  }
} */

resource "sigsci_site_rule" "rate-limit-foreign-domains" {
  site_short_name = var.sigsci_site
  type            = "rateLimit"
  group_operator  = "all"
  enabled         = true
  reason          = "Too many attempts for invalid domain"
  signal          = "site.counting"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.domain-request,
    sigsci_site_signal_tag.counting
    ]

  conditions {
    field = "signal"
    operator = "doesNotExist"
    type = "multival"
    group_operator = "all"
    
    conditions {
      field = "signalType"
      operator = "equals"
      type = "single"
      value = "site.domain-request"
    }
  }

  rate_limit = {
    duration  = 600
    interval  = 1
    threshold = 100
  }

  actions {
    response_code = 429
    signal        = "site.domain-request"
    type          = "blockSignal"
  }
}

resource "sigsci_site_rule" "suspected-attacker" {
  site_short_name = var.sigsci_site
  type            = "rateLimit"
  group_operator  = "all"
  enabled         = true
  reason          = "Suspected Attacker"
  signal          = "site.suspected-attacker"
  expiration      = ""
  depends_on = [
    sigsci_site_signal_tag.suspected-attacker,
    sigsci_site_signal_tag.domain-request
    ]

  conditions {
    field = "responseHeader"
    operator = "exists"
    type = "multival"
    group_operator = "all"
    
    conditions {
      field = "valueString"
      operator = "like"
      type = "single"
      value = "[4-5][0-9][0-9]"
    }
  }

  rate_limit = {
    duration  = 600
    interval  = 1
    threshold = 100
  }

  actions {
    response_code = 429
    signal        = "site.domain-request"
    type          = "blockSignal"
  }
}

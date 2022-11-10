resource "sigsci_site_signal_tag" "loginpwdreset" {
  site_short_name = var.sigsci_site
  name            = "loginPwdReset"
  description     = "Prevent scripted attempts for login/password resets"
}

resource "sigsci_site_signal_tag" "testalert" {
  site_short_name = var.sigsci_site
  name            = "testAlert"
  description     = "This is just a test"
}

resource "sigsci_site_signal_tag" "ofac" {
  site_short_name = var.sigsci_site
  name            = "OFAC"
  description     = "Country is in list OFAC"
}

resource "sigsci_site_signal_tag" "bad-agent" {
  site_short_name = var.sigsci_site
  name            = "Bad User Agents"
  description     = "Useragent is anomalous"
}

resource "sigsci_site_signal_tag" "domain-request" {
  site_short_name = var.sigsci_site
  name            = "Domain Request"
  description     = "Example Domain traffic"
}

resource "sigsci_site_signal_tag" "counting" {
  site_short_name = var.sigsci_site
  name            = "Counting"
  description     = "RL Counter"
}

resource "sigsci_site_signal_tag" "suspected-attacker" {
  site_short_name = var.sigsci_site
  name            = "Suspected Attacker"
  description     = "RL Counter for Suspected Attacker"
}

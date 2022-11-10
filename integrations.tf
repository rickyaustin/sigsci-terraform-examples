resource "sigsci_site_integration" "mailing-list" {
  site_short_name = var.sigsci_site  
  type   = "mailingList"
  url    = "raustin@fastly.com"
  events = ["agentAlert", "flag", "loggingModeChanged"]
}

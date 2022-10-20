resource "sigsci_site_integration" "mailing-list" {
  site_short_name = "gcp_lab"  
  type   = "mailingList"
  url    = "raustin@fastly.com"
  events = ["agentAlert", "flag", "loggingModeChanged"]
}
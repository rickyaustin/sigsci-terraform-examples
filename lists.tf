resource "sigsci_site_list" "ofac" {
  site_short_name = "gcp_lab"
  name            = "OFAC Countries"
  type            = "country"
  description     = "Countries in the OFAC List"
  entries = [
    "SY",
    "BY",
    "MM",
    "KP",
    "IQ",
    "CD",
    "SD",
    "IR",
    "LR",
    "ZW",
    "CU",
    "CI",
  ]
}

resource "sigsci_site_list" "bad-user-agents" {
  site_short_name = "gcp_lab"
  name            = "Bad User Agents"
  type            = "wildcard"
  description     = "Anomalous User Agents"
  entries = [
    "curl*",
    "*python*",
    "*wpscan*",
    "*nmap*",
    "*masscan",
  ]
}
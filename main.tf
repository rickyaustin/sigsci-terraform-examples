# Terraform 0.13.x
terraform {
  required_providers {
    sigsci = {
      source = "signalsciences/sigsci"
    }
  }
}

provider "sigsci" {
  corp = var.sigsci_corp
  email = var.sigsci_email
  auth_token = var.sigsci_token
  password = ""
}

















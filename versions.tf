terraform {
  required_version = ">= 1.1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 1.0"
    }
    awx = {
      source  = "denouche/awx"
      version = ">= 0.15.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0.0"
    }
  }
}

module "awx_vault_key" {
  source                  = "../.."
  vault_credential_name   = "example"
  vault_backend_role_name = "awx"
  vault_auth_path         = "token"
  vault_vaild_principals  = ["user@mycompany.com"]
  vault_url               = "http://localhost:8200"
  vault_authentication_config = {
    token = "root"
  }

  awx_organization_id         = 1
  awx_machine_credential_name = "my_awesome_credential"
}


terraform {
  required_providers {
    awx = {
      source  = "denouche/awx"
      version = "0.15.0"
    }
  }
}

provider "awx" {
  hostname = "http://192.168.49.2:30080"
  insecure = true
  username = "admin"
  password = "example"
}

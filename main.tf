locals {
  # ID for hashicorp credential type in AWX.
  hashicorp_ssh_credential_type_id = 24
  create_keypair                   = var.awx_machine_credential_key == null
  ssh_private_key                  = local.create_keypair ? tls_private_key.generated_key[0].private_key_openssh : var.awx_machine_credential_key.private_key
  ssh_public_key                   = local.create_keypair ? tls_private_key.generated_key[0].public_key_openssh : var.awx_machine_credential_key.public_key

  valid_principals = var.vault_vaild_principals == null ? null : join(",", var.vault_vaild_principals)

}

resource "awx_credential" "this" {
  name               = var.vault_credential_name
  credential_type_id = local.hashicorp_ssh_credential_type_id
  organization_id    = var.awx_organization_id
  inputs = jsonencode(
    merge(
      {
        url = var.vault_url
      },
      var.vault_authentication_config
    )
  )
}

resource "awx_credential_machine" "this" {
  name            = var.awx_machine_credential_name
  organization_id = var.awx_organization_id
  ssh_key_data    = local.ssh_private_key
  username        = var.awx_machine_credential_username

  # Required as the key will be reported as $encrypted$ causing drift every time
  lifecycle {
    ignore_changes = [
      ssh_key_data
    ]
  }
}

resource "awx_credential_input_source" "this" {
  source           = awx_credential.this.id
  target           = awx_credential_machine.this.id
  input_field_name = "ssh_public_key_data"
  metadata = {
    role             = var.vault_backend_role_name
    public_key       = local.ssh_public_key
    auth_path        = var.vault_auth_path
    secret_path      = var.vault_secret_path
    valid_principals = local.valid_principals
  }

}



####################### Conditional SSH key generation
resource "tls_private_key" "generated_key" {
  count     = local.create_keypair ? 1 : 0
  algorithm = "ED25519"
}

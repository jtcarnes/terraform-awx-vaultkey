output "awx_ssh_key_pair" {
  sensitive   = true
  description = "Keypair for the machine credential, either generated or passed in."
  value = {
    public_key  = local.ssh_public_key
    private_key = local.ssh_private_key
  }
}

output "awx_machine_credential_id" {
  description = "ID of the created machine credential."
  value       = awx_credential_machine.this.id
}

output "vault_credential_id" {
  description = "ID of the vault credential created."
  value       = awx_credential.this.id
}

output "vault_credential_input_source_id" {
  description = "ID of the credential input source. Generally unneeded."
  value       = awx_credential_input_source.this.id
}


## Vault variables
variable "vault_credential_name" {
  type        = string
  description = "Name for the Vault credential in AWX."
}

variable "vault_backend_role_name" {
  type        = string
  description = "Name of the Vault role used to sign the ssh key."
}

variable "vault_secret_path" {
  type        = string
  default     = "ssh"
  description = "Path to the SSH signing backend in Vault."
}

variable "vault_auth_path" {
  type        = string
  default     = ""
  description = "Path to authentication method on Vault backend."
}

variable "vault_vaild_principals" {
  type        = list(string)
  default     = null
  description = "List of either usernames or hostnames that the certificate should be signed for."
}

variable "vault_url" {
  type        = string
  nullable    = false
  description = "URL of the Vault instance from the perspective of the AWX instance."
}

variable "vault_authentication_config" {
  type        = map(string)
  description = "Authentication configuration for AWX to authenticate to Vault. Valid options are \"token\", \"role_id\" and \"secret_id\", or \"kubernetes_role\". Optional configs are \"cacert\", \"default_auth_path\", and \"namespace\"."
  nullable    = false
  validation {
    error_message = "Config must include at least on of {\"token\", \"role_id\" and \"secret_id\" or \"kubernetes_role\"}"
    condition     = contains(keys(var.vault_authentication_config), "token") || contains(keys(var.vault_authentication_config), "kubernetes_role") || (contains(keys(var.vault_authentication_config), "role_id") && contains(keys(var.vault_authentication_config), "secret_id"))
  }
  validation {
    error_message = "Config can only include: \"token\", \"role_id\", \"secret_id\", \"kubernetes_role\", \"cacert\", \"default_auth_path\", and \"namespace\"."
    condition     = alltrue([for x in keys(var.vault_authentication_config) : contains(["token", "role_id", "secret_id", "kubernetes_role", "cacert", "default_auth_path", "namespace"], x)])
  }
}

## AWX variables
variable "awx_organization_id" {
  type        = number
  description = "ID of the AWX organization."
}

variable "awx_machine_credential_name" {
  type        = string
  description = "Name for the machine credential."
}

variable "awx_machine_credential_username" {
  type        = string
  description = "Username for the AWX credential."
  default     = null
}

variable "awx_machine_credential_key" {
  type = object({
    public_key  = string
    private_key = string
  })
  default     = null
  sensitive   = true
  description = "The SSH key that will be SIGNED by Hashicorp vault. If not provided one will be generated."
}

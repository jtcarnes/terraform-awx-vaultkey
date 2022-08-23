# Terraform AWX Vault Key Module

Terraform module to create ssh key for Ansible AWX using Hashicorp Vaults ssh cert backend.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_awx"></a> [awx](#requirement\_awx) | >= 0.15.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider\_awx) | >= 0.15.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_credential.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential) | resource |
| [awx_credential_input_source.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential_input_source) | resource |
| [awx_credential_machine.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential_machine) | resource |
| [tls_private_key.generated_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_awx_machine_credential_key"></a> [awx\_machine\_credential\_key](#input\_awx\_machine\_credential\_key) | The SSH key that will be SIGNED by Hashicorp vault. If not provided one will be generated. | <pre>object({<br>    public_key  = string<br>    private_key = string<br>  })</pre> | `null` | no |
| <a name="input_awx_machine_credential_name"></a> [awx\_machine\_credential\_name](#input\_awx\_machine\_credential\_name) | Name for the machine credential. | `string` | n/a | yes |
| <a name="input_awx_machine_credential_username"></a> [awx\_machine\_credential\_username](#input\_awx\_machine\_credential\_username) | Username for the AWX credential. | `string` | `null` | no |
| <a name="input_awx_organization_id"></a> [awx\_organization\_id](#input\_awx\_organization\_id) | ID of the AWX organization. | `number` | n/a | yes |
| <a name="input_vault_auth_path"></a> [vault\_auth\_path](#input\_vault\_auth\_path) | Path to authentication method on Vault backend. | `string` | `""` | no |
| <a name="input_vault_authentication_config"></a> [vault\_authentication\_config](#input\_vault\_authentication\_config) | Authentication configuration for AWX to authenticate to Vault. Valid options are "token", "role\_id" and "secret\_id", or "kubernetes\_role". Optional configs are "cacert", "default\_auth\_path", and "namespace". | `map(string)` | n/a | yes |
| <a name="input_vault_backend_role_name"></a> [vault\_backend\_role\_name](#input\_vault\_backend\_role\_name) | Name of the Vault role used to sign the ssh key. | `string` | n/a | yes |
| <a name="input_vault_credential_name"></a> [vault\_credential\_name](#input\_vault\_credential\_name) | Name for the Vault credential in AWX. | `string` | n/a | yes |
| <a name="input_vault_secret_path"></a> [vault\_secret\_path](#input\_vault\_secret\_path) | Path to the SSH signing backend in Vault. | `string` | `"ssh"` | no |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | URL of the Vault instance from the perspective of the AWX instance. | `string` | n/a | yes |
| <a name="input_vault_vaild_principals"></a> [vault\_vaild\_principals](#input\_vault\_vaild\_principals) | List of either usernames or hostnames that the certificate should be signed for. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_awx_machine_credential_id"></a> [awx\_machine\_credential\_id](#output\_awx\_machine\_credential\_id) | ID of the created machine credential. |
| <a name="output_awx_ssh_key_pair"></a> [awx\_ssh\_key\_pair](#output\_awx\_ssh\_key\_pair) | Keypair for the machine credential, either generated or passed in. |
| <a name="output_vault_credential_id"></a> [vault\_credential\_id](#output\_vault\_credential\_id) | ID of the vault credential created. |
| <a name="output_vault_credential_input_source_id"></a> [vault\_credential\_input\_source\_id](#output\_vault\_credential\_input\_source\_id) | ID of the credential input source. Generally unneeded. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_awx"></a> [awx](#requirement\_awx) | >= 0.15.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider\_awx) | 0.15.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_credential.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential) | resource |
| [awx_credential_input_source.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential_input_source) | resource |
| [awx_credential_machine.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential_machine) | resource |
| [tls_private_key.generated_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_awx_machine_credential_key"></a> [awx\_machine\_credential\_key](#input\_awx\_machine\_credential\_key) | The SSH key that will be SIGNED by Hashicorp vault. If not provided one will be generated. | <pre>object({<br>    public_key  = string<br>    private_key = string<br>  })</pre> | `null` | no |
| <a name="input_awx_machine_credential_name"></a> [awx\_machine\_credential\_name](#input\_awx\_machine\_credential\_name) | Name for the machine credential. | `string` | n/a | yes |
| <a name="input_awx_machine_credential_username"></a> [awx\_machine\_credential\_username](#input\_awx\_machine\_credential\_username) | Username for the AWX credential. | `string` | `null` | no |
| <a name="input_awx_organization_id"></a> [awx\_organization\_id](#input\_awx\_organization\_id) | ID of the AWX organization. | `number` | n/a | yes |
| <a name="input_vault_auth_path"></a> [vault\_auth\_path](#input\_vault\_auth\_path) | Path to authentication method on Vault backend. | `string` | `""` | no |
| <a name="input_vault_authentication_config"></a> [vault\_authentication\_config](#input\_vault\_authentication\_config) | Authentication configuration for AWX to authenticate to Vault. Valid options are "token", "role\_id" and "secret\_id", or "kubernetes\_role". Optional configs are "cacert", "default\_auth\_path", and "namespace". | `map(string)` | n/a | yes |
| <a name="input_vault_backend_role_name"></a> [vault\_backend\_role\_name](#input\_vault\_backend\_role\_name) | Name of the Vault role used to sign the ssh key. | `string` | n/a | yes |
| <a name="input_vault_credential_name"></a> [vault\_credential\_name](#input\_vault\_credential\_name) | Name for the Vault credential in AWX. | `string` | n/a | yes |
| <a name="input_vault_secret_path"></a> [vault\_secret\_path](#input\_vault\_secret\_path) | Path to the SSH signing backend in Vault. | `string` | `"ssh"` | no |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | URL of the Vault instance from the perspective of the AWX instance. | `string` | n/a | yes |
| <a name="input_vault_vaild_principals"></a> [vault\_vaild\_principals](#input\_vault\_vaild\_principals) | List of either usernames or hostnames that the certificate should be signed for. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_awx_machine_credential_id"></a> [awx\_machine\_credential\_id](#output\_awx\_machine\_credential\_id) | ID of the created machine credential. |
| <a name="output_awx_ssh_key_pair"></a> [awx\_ssh\_key\_pair](#output\_awx\_ssh\_key\_pair) | Keypair for the machine credential, either generated or passed in. |
| <a name="output_vault_credential_id"></a> [vault\_credential\_id](#output\_vault\_credential\_id) | ID of the vault credential created. |
| <a name="output_vault_credential_input_source_id"></a> [vault\_credential\_input\_source\_id](#output\_vault\_credential\_input\_source\_id) | ID of the credential input source. Generally unneeded. |
<!-- END_TF_DOCS -->
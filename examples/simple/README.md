# Simple AWX Vault Example

Configuration here show how to create a simple AWX machine credential that uses hashicorp vault.

## Usage

To run this example you will need:

- An AWX instance available
- Vault available and configured

Then:

```bash
terraform init
terraform plan
terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_awx"></a> [awx](#requirement\_awx) | 0.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_awx_vault_key"></a> [awx\_vault\_key](#module\_awx\_vault\_key) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

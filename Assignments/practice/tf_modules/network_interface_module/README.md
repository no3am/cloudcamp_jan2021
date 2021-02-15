# Resrouce Group

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg_name | The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created. | `string` | no | yes |
| location | The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created. | `string` | no | yes |
| ip_config_name | A name used for this IP Configuration. | `string` | no | yes |
| p_ip_address_allocation | The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | yes | yes |
| subnet_id | The ID of the Subnet where this Network Interface should be located in. | `string` | no | no |

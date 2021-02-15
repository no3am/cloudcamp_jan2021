# Resrouce Group

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg_name | The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created. | `string` | no | yes |
| location | The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created. | `string` | no | yes |
| cidr_address | The address space that is used the virtual network. You can supply more than one address space | `list` | no | yes

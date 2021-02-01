# Resrouce Group

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg_name | The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created. | `string` | no | yes |
| subnet_name | The name of the subnet. Changing this forces a new resource to be created. | `string` | no | yes |
| vnet_name | The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `string` | no | yes |
| address_prefixes | The address prefixes to use for the subnet. | `list` | no | no |

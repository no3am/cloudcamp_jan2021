create a repo per module

terraform plan -var-file dev.tfvars

base64 answer is first here: https://github.com/terraform-providers/terraform-provider-azurerm/issues/6138  
and then here: https://www.terraform.io/docs/language/functions/base64encode.html

nice init.d for java:
https://gist.github.com/mtsoleimani/eaf0191f7d7200f04ef9526b63044aeb
https://gist.github.com/nullpointer0x00/24feeb296658825baf58ad3ad7e35136


upload file to blob:

az storage blob upload --account-name naimtestsa --account-key 't0fZLoGYK+JOn7YPp8g5mmfqCFtIInyV/LStDH/+k3H8wnRCnM7obeE5UCNqYhrTj/eELOxt960brZteo1ze8Q==' --container-name hello-jar --file Main.jar --name main.jar
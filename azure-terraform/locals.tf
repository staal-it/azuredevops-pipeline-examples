locals {
  environment_file       = yamldecode(file(var.ENVIRONMENT_YML))

  storage_account_name = "terraform-example-${local.environment_file.name}"
  vnet_address_space = "192.168.1.0/24"
}
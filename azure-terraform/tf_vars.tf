# the variable values are inserted into terraform by using environment variables (see https://www.terraform.io/docs/language/values/variables.html)
# the names of the variables need to be capitalized because azure devops automatically does this with all variables in azurecli tasks
variable "TENANT_ID" {
  description = "The azure tenantid"    
  type = string
}

variable "SUBSCRIPTION_ID" {
    description = "The subscriptionId to deploy to"
    type = string
}

variable "ENVIRONMENT_YML" {
    description = "The name of the resourcegroup to create"
    type = string
}
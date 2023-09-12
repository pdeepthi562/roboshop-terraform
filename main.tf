

#terraform {
#  backend "s3" {}
#}
#
#variable "test" {}
#output "test" {
#  value = var.test
#}

module "components" {

  source     = "git::https://github.com/pdeepthi562/tf-module-vpc.git"

  for_each = var.vpc
  cidr = each.value["cidr"]
  subnets =each.value["subnets"]
}
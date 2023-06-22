locals {
  name        = "skaf"
  region      = "us-east-1"
  environment = "stage"
  additional_aws_tags = {
    Owner      = "SquareOps"
    Expires    = "Never"
    Department = "Engineering"
  }
  vpc_cidr = "10.10.0.0/16"
}

module "vpc" {
  source                 = "../.."
  name                   = local.name
  vpc_cidr               = local.vpc_cidr
  environment            = local.environment
  availability_zones     = 6
  public_subnet_enabled  = true
  private_subnet_enabled = true
  intra_subnet_enabled  = false
  database_subnet_enabled = false
  auto_assign_public_ip  = true
  ipv6_enabled = true
  public_subnet_assign_ipv6_address_on_creation = true
  private_subnet_assign_ipv6_address_on_creation = true
  database_subnet_assign_ipv6_address_on_creation = true
  intra_subnet_assign_ipv6_address_on_creation = true 


}

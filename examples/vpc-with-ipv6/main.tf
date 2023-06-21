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
  availability_zones     = 2
  public_subnet_enabled  = true
  private_subnet_enabled = true
  intra_subnet_enabled  = true
  database_subnet_enabled = true
  auto_assign_public_ip  = true
  ipv6_enabled = true

}

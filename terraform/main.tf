# Provider that will be used
provider "aws" {
  region     = var.aws_region
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
}

# Caling module to create single instance
module "ec2_instance" {
  source   = "./modules/aws_ec2"
  aws_type = var.aws_type
  aws_ami  = var.aws_ami
}

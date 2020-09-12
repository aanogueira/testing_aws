###
# Basic module to instanciate new ec2 instances
###

# Terraform version requirement
terraform {
  required_version = ">= 0.12"
}

# Instancitae new ec2 instance with given parameters
resource "aws_instance" "webserver" {
  instance_type = var.aws_type
  ami           = var.aws_ami
}

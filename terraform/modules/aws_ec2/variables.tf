# ID of the instance to be created
variable "aws_ami" {
  type        = string
  description = "Instance ami ID."
}

# Type of the instance to be created
variable "aws_type" {
  type        = string
  description = "Instance type."
}

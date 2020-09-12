# Region of the project
variable "aws_region" {
  type        = string
  description = "Project region."
  default     = "us-west-2" # Updated with your region
}

# ID of the instance to be created
variable "aws_ami" {
  type        = string
  description = "Instance ami ID."
  default     = "ami-082335b69bcfdb15b" # This might need to be updated since they are constantly changing
}

# Type of the instance to be created
variable "aws_type" {
  type        = string
  description = "Instance type."
  default     = "t2.micro" # Updated with your desired instance type (this one is present in the free tier)
}

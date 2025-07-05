variable "public_key" {
  description = "Main private key for accessing to ec2 machines for our project"
  type        = string
}

variable "ec2_ami" {
  description = "Selected AMI for vm's image"
  type        = string
  default     = "ami-080e1f13689e07408"
}

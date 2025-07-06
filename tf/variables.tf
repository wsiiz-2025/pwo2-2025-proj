variable "public_key" {
  description = "Main private key"
  type        = string
}

variable "ec2_ami" {
  description = "AMI for VM image"
  type        = string
  default     = "ami-080e1f13689e07408"
}

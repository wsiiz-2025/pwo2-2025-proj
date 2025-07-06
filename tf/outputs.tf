output "tf_public_ips" {
  value       = aws_instance.tf_ec2.*.public_ip
  description = "Public IPs"
}

output "tf_private_ips" {
  value = aws_instance.tf_ec2.*.private_ip
  description = "Private IPs"
}

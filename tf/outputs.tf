output "tf_docker_public_ips" {
  value       = aws_instance.tf_docker_ec2.*.public_ip
  description = "Public IPs for VMs"
}

output "tf_docker_private_ips" {
  value = aws_instance.tf_docker_ec2.*.private_ip
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "instance_private_ips" {
  value = aws_instance.bastion.private_ip
}

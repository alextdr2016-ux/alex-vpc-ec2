output "vpc_id" {
  value       = "aws_vpc.alex.id"
  description = "ID-ul VPC-ului alex"
}

output "instance_id" {
  value       = "aws_instance.alex_instance.id"
  description = "ID-ul instanței EC2 alex"

}

output "instance_public_ip" {
  value       = "aws_instance.alex_instance.public_ip"
  description = "Adresa IP publică a instanței EC2 alex"
}



# Alex VPC EC2 Project

## Descriere
Proiect Terraform care creează:
- VPC cu CIDR 10.0.0.0/16
- Subnet cu CIDR 10.0.1.0/24
- Internet Gateway
- Route Table
- Security Group (SSH + egress)
- EC2 Instance (t3.nano, Amazon Linux 2)

## Cum să folosești
1. `terraform init`
2. `terraform plan`
3. `terraform apply`

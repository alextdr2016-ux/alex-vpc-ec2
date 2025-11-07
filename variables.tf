variable "aws_region" {
  description = "eu-north-1"
  type        = string
  default     = "eu-north-1"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.nano"
}
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-07fb0a5bf9ae299a4" # Example AMI ID for eu-north-1
}

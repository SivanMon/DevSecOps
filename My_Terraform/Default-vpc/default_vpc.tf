terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# --- Variables you can tweak ---
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "az" {
  description = "AZ for the managed subnet"
  type        = string
  default     = "us-east-1a"
}

variable "managed_subnet_cidr" {
  description = "CIDR for the new subnet inside the default VPC CIDR (172.31.0.0/16)"
  type        = string
  # Pick a range unlikely to overlap with AWS's default /20 subnets; adjust if 'overlaps with another subnet' appears in plan/apply
  default     = "172.31.224.0/20"
}

# --- Manage the Default VPC (do not create a new VPC) ---
resource "aws_default_vpc" "default" {
  tags = { Name = "Default VPC" }
}

# Read the existing Internet Gateway attached to the Default VPC
data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [aws_default_vpc.default.id]
  }
}

# Create ONE Terraform-managed public subnet in a specific AZ
resource "aws_subnet" "public_managed" {
  vpc_id                  = aws_default_vpc.default.id
  cidr_block              = var.managed_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = { Name = "Managed Public Subnet (${var.az})" }
}

# A dedicated route table for the managed subnet (leave AWS's default RT alone)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_default_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = { Name = "Managed Public RT" }
}

# Associate the route table to the managed subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_managed.id
  route_table_id = aws_route_table.public_rt.id
}

# (Optional) Keep default SG managed only for tags, without changing rules
resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_default_vpc.default.id
  tags   = { Name = "Default Security Group" }
}

# --- Helpful outputs ---
output "managed_subnet_id" {
  value = aws_subnet.public_managed.id
}

output "managed_route_table_id" {
  value = aws_route_table.public_rt.id
}

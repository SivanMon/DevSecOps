# AWS Data Sources Terraform Exercise
# Complete the missing parts marked with TODO comments

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # BONUS providers for TODO 7–8
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

# TODO 1: current caller identity
data "aws_caller_identity" "current" {
  # no arguments needed
}

# TODO 2: latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# TODO 3: available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# TODO 4: output caller identity fields
output "caller_identity_info" {
  description = "Information about the current AWS caller"
  value = {
    account_id = data.aws_caller_identity.current.account_id
    arn        = data.aws_caller_identity.current.arn
    user_id    = data.aws_caller_identity.current.user_id
  }
}

# TODO 5: output AMI fields
output "amazon_linux_ami_info" {
  description = "Latest Amazon Linux 2 AMI information"
  value = {
    ami_id        = data.aws_ami.amazon_linux.id
    name          = data.aws_ami.amazon_linux.name
    creation_date = data.aws_ami.amazon_linux.creation_date
    description   = data.aws_ami.amazon_linux.description
    architecture  = data.aws_ami.amazon_linux.architecture
  }
}

# TODO 6: output AZs info (names, ids, count)
output "availability_zones_info" {
  description = "Available availability zones"
  value = {
    zone_names = data.aws_availability_zones.available.names
    zone_ids   = data.aws_availability_zones.available.zone_ids
    count      = length(data.aws_availability_zones.available.names)
  }
}

# TODO 7 (BONUS): write a summary file
resource "local_file" "data_summary" {
  filename = "aws_data_summary.txt"
  content  = <<-EOT
    AWS Data Sources Summary
    =======================

    Current AWS Account: ${data.aws_caller_identity.current.account_id}
    User ARN: ${data.aws_caller_identity.current.arn}

    Latest Amazon Linux 2 AMI:
    - AMI ID: ${data.aws_ami.amazon_linux.id}
    - Name: ${data.aws_ami.amazon_linux.name}
    - Created: ${data.aws_ami.amazon_linux.creation_date}

    Available Zones: ${join(", ", data.aws_availability_zones.available.names)}
    Total Zones: ${length(data.aws_availability_zones.available.names)}
  EOT
}

# TODO 8 (BONUS): print to console using a provisioner
resource "null_resource" "print_to_console" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "=== AWS Data Sources Information ==="
      echo "Account ID: ${data.aws_caller_identity.current.account_id}"
      echo "AMI ID: ${data.aws_ami.amazon_linux.id}"
      echo "Availability Zones: ${join(", ", data.aws_availability_zones.available.names)}"
      echo "=================================="
    EOT
  }

  depends_on = [
    data.aws_caller_identity.current,
    data.aws_ami.amazon_linux,
    data.aws_availability_zones.available
  ]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_instance" "docker" {
  count           = var.aws_number
  ami             = var.aws_ami
  instance_type   = var.aws_instance_type
  key_name        = var.aws_key_file
  security_groups = ["${var.aws_sg}"]
  # iam_instance_profile = "ulrich"
  ebs_optimized = true
  monitoring    = true
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = "${var.aws_common_tag}-${count.index}"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = var.aws_stockage
    encrypted             = true
  }
  
}

resource "null_resource" "infos" {
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${join(", ", aws_instance.docker[*].public_ip)} > infos_ec2.txt"
  }
}
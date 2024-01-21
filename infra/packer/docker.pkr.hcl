packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}


locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "docker_image" {
  access_key    = "PUT YOUR OWN"
  secret_key    = "PUT YOUR OWN"
  ami_name      = "docker_image_${local.timestamp}"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami    = "ami-0fc5d935ebf8bc3bc"
  ssh_username  = "ubuntu"
  launch_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    project = "aws_labs_project"
  }
}

build {
  name    = "docker_image"
  sources = ["source.amazon-ebs.docker_image"]

  provisioner "shell" {
    scripts = ["./scripts/docker.sh"]
  }
}
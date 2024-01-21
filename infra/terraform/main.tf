terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
    access_key    = "AKIAQBYPIPCM2GEEYPMF"
    secret_key    = "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"
  
}
module "services" {
  source = "./modules/services"
  aws_sg = "docker"

}
module "docker" {
  source         = "./modules/docker"
  aws_ami        = "ami-0b9b79f2f89fdbe9c" #Image with Docker && Docker-compose
  aws_sg         = module.services.output_sg_name
  aws_common_tag = "docker"
  aws_key_file   = var.aws_key
  aws_number     = var.number
}
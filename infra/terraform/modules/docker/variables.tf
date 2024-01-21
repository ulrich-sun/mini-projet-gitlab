variable "aws_sg" {
  type    = string
  default = "NULL"
}

locals {
  private_key = "${var.aws_key_file}.pem"
}

variable "aws_key_file" {
  type = string
}
variable "aws_ami" {
  type = string
}

variable "aws_instance_type" {
  default = "t3.medium"
  type    = string
}

variable "aws_stockage" {
  default = 50
  type    = number
}

variable "aws_number" {
  default = 1
  type    = number
}

variable "aws_common_tag" {
  type = string
}
variable "aws_region" {
  default = "us-east-1"
}
variable "aws_stack" {
  type    = string
  default = "docker"
}
variable "number" {
  type    = number
  default = 1
}

variable "aws_key" {
  type    = string
  default = "ulrich.pem"
}
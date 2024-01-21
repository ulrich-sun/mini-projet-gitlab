variable "aws_sg" {
  type        = string
  description = "security group for all infrastructure"
  default     = "ulrich_sg"
}

variable "aws_port" {
  type    = list(number)
  default = [22, 80, 443, 8080]

}
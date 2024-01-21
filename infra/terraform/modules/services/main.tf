resource "aws_security_group" "Security_group_labs" {
  name        = "${var.aws_sg}-sg"
  description = "Allow all traffic on specified ports"

  dynamic "ingress" {
    for_each = var.aws_port
    content {
      description = "ingress port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.aws_port
    content {
      description = "egress port ${egress.value}"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
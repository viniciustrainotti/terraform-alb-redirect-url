resource "aws_security_group" "lb_sg" {
  name        = "lb_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  dynamic "ingress" { 
    for_each = [443, 80]
    content {
      description      = ""
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "lb_sg"
  }
}
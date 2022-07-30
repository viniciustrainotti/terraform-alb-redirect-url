resource "aws_lb" "this" {
  name               = "application-alb-redirect"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-94a98ef2", "subnet-ddb64091"]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.example.bucket
    prefix  = "test-lb"
    enabled = false
  }

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      host        = var.host
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}

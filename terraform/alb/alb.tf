resource "aws_lb" "app_alb" {
  name               = var.alb_ingress_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.eks.security_group_id]
  subnets            = var.subnets

  enable_deletion_protection = false
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}

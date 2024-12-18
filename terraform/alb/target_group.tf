resource "aws_lb_target_group" "app_target_group" {
  name     = "${var.alb_ingress_name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

##################################################################################
# Application Load Balancer
##################################################################################

#Application Load Balancer
resource "aws_lb" "external_app_lb" {
  name               = "ExternalLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [module.vpc.public_subnets[0] , module.vpc.public_subnets[1]]


  enable_deletion_protection = false

  tags = var.project_tags
}

#Application Load Balancer Target Group
resource "aws_lb_target_group" "lb_tg" {
  name     = "AlbTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

#Application Load Balancer Instances
resource "aws_lb_target_group_attachment" "alb_tg_attach1" {
  target_group_arn = aws_lb_target_group.lb_tg.arn
  target_id        = aws_instance.instance1.id
  port             = 80

  depends_on = [ aws_instance.instance1 ]
}

resource "aws_lb_target_group_attachment" "alb_tg_attach2" {
  target_group_arn = aws_lb_target_group.lb_tg.arn
  target_id        = aws_instance.instance2.id
  port             = 80

  depends_on = [ aws_instance.instance2 ]
}

#Application Load Balancer Listener
resource "aws_lb_listener" "alb_listenr" {
  load_balancer_arn = aws_lb.external_app_lb.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg.arn
  }
}


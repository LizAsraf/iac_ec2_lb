resource "aws_lb_listener" "lb_listener" {
  count = length(aws_alb.aplication_lb)
  load_balancer_arn = aws_alb.aplication_lb[count.index].arn
  port              = var.listener.port
  protocol          = var.listener.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg[count.index].arn
  }
}

resource "aws_lb_target_group_attachment" "lb_att_instance" {
  count = length(var.subnet) > 1 ? 1:0
  target_group_arn = aws_lb_target_group.lb-tg[count.index].arn
  target_id        = element(var.instances_ids, count.index)
  port             = 80
}

resource "aws_lb_target_group" "lb-tg" {
  name = "lb-${var.vpcname}"
  count = length(aws_alb.aplication_lb)
  port              = var.target_group.port
  protocol          = var.target_group.protocol
  vpc_id   = var.vpcid
  tags = merge(
    var.tags,
    {
      Name = "lb-${var.vpcname}"
    },
  )
}

resource "aws_alb" "aplication_lb" {
  name = "aplicationlb-${var.vpcname}"
  count = length(var.subnet) > 1 ? 1:0
  internal           = false
  security_groups    = ["${var.security_groups}"]
  subnets            = var.subnet
    tags = merge(
    var.tags,
    {
      Name = "aplicationlb-${var.vpcname}"
    },
  )
}
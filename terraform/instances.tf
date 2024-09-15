resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  desired_capacity     = 2
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = [aws_subnet.private[0].id, aws_subnet.private[1].id]
  launch_configuration = aws_launch_configuration.app.id

}

data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:Name"
    values = ["app-instance"]
  }
}

output "instance_private_ips" {
  value = data.aws_instances.asg_instances.private_ips
}

# resource "aws_security_group" "lb_sg" {
#   name        = "lb-security-group"
#   description = "Security group for the load balancer"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_lb" "app" {
#   name               = "app-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [aws_subnet.public[0].id, aws_subnet.public[1].id]
# }

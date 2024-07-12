resource "aws_security_group" "the_stack-sg" {
  name        = "the_stack-sg"
  description = "security group for THE ssh"
  vpc_id      = aws_vpc.the.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "the_stack-sg"
  }
}
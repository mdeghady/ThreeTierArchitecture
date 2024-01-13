##################################################################################
# INSTANCES SECURITY GROUP
##################################################################################


resource "aws_security_group" "ec2_sg" {
  name        = "ThreeTierSG"
  description = "Allow HTTP & SSH from anywhere"
  vpc_id      = module.vpc.vpc_id
#HTTP access from anywhere
  ingress {
    description      = "HTTP access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

#SSH access from anywhere
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "WEB SG"
  }
}
##################################################################################
# DATABASE SECURITY GROUP
##################################################################################

resource "aws_security_group" "db_sg" {
  name        = "Database security group"
  description = "Allow inbound trrafic from application layer"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Allow traffic fom application layer"
    from_port        = 3306
    to_port          = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port        = 32768
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "Database SG"
  }
}
##################################################################################
# App Instances
##################################################################################


resource "aws_instance" "instance1" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  key_name                    = "mostafa"

  tags = var.project_tags
}


resource "aws_instance" "instance2" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[1]
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  key_name                    = "mostafa"


  tags = var.project_tags
}

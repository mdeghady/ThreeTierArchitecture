##################################################################################
# RDS INSTANCE
##################################################################################

resource "aws_db_instance" "mysql_db" {
  identifier             = "three-tier-db"
  allocated_storage      = 10
  db_subnet_group_name   = module.vpc.database_subnet_group
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  multi_az               = true
  username               = "admin"
  password               = "admin1234"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot    = true

  tags = var.project_tags
}

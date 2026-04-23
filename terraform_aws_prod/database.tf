# RDS Security Group
resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "Allow traffic from App Security Group only"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = aws_subnet.database[*].id

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# RDS Instance
resource "aws_db_instance" "main" {
  identifier            = "${var.project_name}-db"
  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.small"
  
  db_name              = "vietstar_db"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]
  
  multi_az               = true
  publicly_accessible    = false
  skip_final_snapshot    = true # Set to false for real production
  
  backup_retention_period = 7
  deletion_protection     = false # Set to true for real production

  tags = {
    Name = "${var.project_name}-rds"
  }
}

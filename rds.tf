# ---------------------------
# RDS Parameter Group
# ---------------------------
# RDS Instance
resource "aws_db_parameter_group" "mysql_standalone_parameter_group" {
  name        = "${var.project}-${var.env}-mysql-standalone-pg"
  family      = "mysql8.0"
  description = "MySQL Standalone Parameter Group"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

# ---------------------------
# RDS Option Group
# ---------------------------
resource "aws_db_option_group" "mysql_standalone_option_group" {
  name                 = "${var.project}-${var.env}-mysql-standalone-og"
  engine_name          = "mysql"
  major_engine_version = "8.0"
}

# ---------------------------
# RDS Subnet Group
# ---------------------------
resource "aws_db_subnet_group" "mysql_standalone_subnet_group" {
  name = "${var.project}-${var.env}-mysql-standalone-sg"
  subnet_ids = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_1c.id
  ]

  tags = {
    Name    = "${var.project}-${var.env}-mysql-standalone-sg"
    Project = var.project
    Env     = var.env
  }
}

# ---------------------------
# RDS Instance
# ---------------------------
resource "random_string" "db_password" {
  length  = 16
  special = false
}

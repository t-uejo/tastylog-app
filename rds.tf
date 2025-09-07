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

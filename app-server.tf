# ---------------------------
# key pair
# ---------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-${var.env}-keypair"
  public_key = file("./assets/tastylog-dev-keypair.pub")

  tags = {
    Name    = "${var.project}-${var.env}-keypair"
    Project = var.project
    Env     = var.env
  }
}


# ---------------------------
# EC2 Instance
# ---------------------------
resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.app.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.keypair.key_name
  security_groups = [
    aws_security_group.app_sg.id,
    aws_security_group.operation_sg.id
  ]

  tags = {
    Name    = "${var.project}-${var.env}-app-ec2"
    Project = var.project
    Env     = var.env
    Type    = "app"
  }
}


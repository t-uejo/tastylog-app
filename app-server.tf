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

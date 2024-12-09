resource "aws_key_pair" "prash" {
  key_name   = "thor123"
  public_key = file("C:\\Users\\HP\\.ssh\\id_rsa.pub")
}


resource "aws_instance" "prash" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "thor123"
  tags = {
    Name = "server-2"
  }
}
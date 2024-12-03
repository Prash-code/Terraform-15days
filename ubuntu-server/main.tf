resource "aws_instance" "prash" {
  ami = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  key_name = "thor123"
  tags = {
    Name = "server-ubuntu"
  }

}
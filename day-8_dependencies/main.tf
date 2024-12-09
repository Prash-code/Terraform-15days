resource "aws_s3_bucket" "prash" {
  bucket = "kuchbhihuh"
  depends_on = [ aws_instance.prash ]
}

resource "aws_instance" "prash" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "server-2"
  }
}

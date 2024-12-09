data "aws_instance" "myawsinstances" {
  filter {
    name = "tag:Name"
    values = [ "server-3" ]
  }

depends_on = [
    "aws_instance.prash"
]
}
output "fetch-public-ip" {
  value = data.aws_instance.myawsinstances.public_ip
}

resource "aws_instance" "prash" {
  ami = "ami-0aebec83a182ea7ea"
  instance_type = "t2.micro"
  tags = {
    Name = "server-3"
  }
}
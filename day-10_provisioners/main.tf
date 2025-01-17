# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"
}


#create vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}
#create subnet
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}
#create internetgateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}
#create and edit RT
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
# associate the RT with subnet
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}
#create security group
resource "aws_security_group" "mysg" {
  name   = "mumbai-sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mumbai-sg"
  }
}
#create EC2
resource "aws_instance" "server" {
  ami                    = "ami-0614680123427b75e"
  instance_type          = "t2.micro"
  key_name      = "thor123"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = aws_subnet.sub1.id
#connection block to connect to ec2
 provisioner "file" {
  source      = "localfile.txt"
  destination = "/home/ec2-user/remotefile.txt"
  connection {
    type        = "ssh"
    host        = aws_instance.server.public_ip
    user        = "ec2-user"
    private_key = file("C:/Users/HP/.ssh/id_ed25519")
  }
}

  # local execution procee 
 provisioner "local-exec" {
    command = "touch file500"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file10"  # Replace with the path to your local file
    destination = "/home/ec2-user/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hello from aws >> file200",
]
 }
}

 
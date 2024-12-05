resource "aws_subnet" "prash" {
  vpc_id                  = var.vpc_id          # Reference to an existing VPC
  cidr_block              = "192.168.0.0/16"       # Replace with your desired CIDR block
  availability_zone       = "ap-south-1"        # Replace with your desired AZ
  map_public_ip_on_launch = true                # Set to true for public subnets
  tags = {
    Name = "prash-subnet"
  }
}

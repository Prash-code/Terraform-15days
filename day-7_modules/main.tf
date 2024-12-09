module "ec2" {
  source = "../day-1"
  instance_type = "t2.micro"
  key_name = "thor123"
}
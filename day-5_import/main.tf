resource "aws_instance" "prash" {
 ami           = "ami-0aebec83a182ea7ea"#(we need to add from state file reference)
 instance_type = "t2.micro"#(we need to add from state file reference)
 #rest all attributes need to be added to match actual resource preseence in AWS 
}
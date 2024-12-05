variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
  default = "ami-0aebec83a182ea7ea"

}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for SSH access"
  type        = string
  default = "thor123"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default = ""
}

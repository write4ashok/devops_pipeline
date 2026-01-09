# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "ubuntu" {
    most_recent = truefilter {
        name   = "Test"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }owners = ["099720109477"] # Canonical
}# provision to ap-south-1 region
provider "aws" {
  region  = "ap-south-1"
}resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "Devops"tags = {
    Name = var.ec2_name
  }
}
# variables.tf
The EC2 name will be set through workflow using the inputs.
variable "ec2_name" {
  type = string
}

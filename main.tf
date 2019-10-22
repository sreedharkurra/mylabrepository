#Provide region
provider "aws" {
  region = "us-east-1"
}

#Specify key pair value
resource "aws_key_pair" "tf-demo" {
  key_name   = "test"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJif090LOECoOjTkCrHH6gJVswlNT1eiFCSmIxxgSYH5EdF6c75SZWDSPyYvWUXf4x2cbZr6goRm+Ms5es9uu3yUoIK4M1t+EQ6b7AJcb0fUR+z9GAP//tQO6Tx7lOcPBxBDH5bdDKosyIEUToVbv4/zYbF3bcFT9R5ya94jAoDe24a5/hr+xibsqXDG+EWvHGfsDT0RfTArUHfOOCKtd+/T6jY9MpeaNxk4oO93+bJMf++06XKmAZKLV3iAoDSf96qhaB8Og1LlU01tjAu89nQOTnLt+UcOrz2UX9/PVdvWAsgDnXsXdDTNOsljAYmzp/FTZwdUxbZtiWs7EGGmj9 kurra@LAPTOP-BDLB6JVF"
}

#create EC2 instance
resource "aws_instance" "instance1" {
  ami = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.tf-demo.key_name}" #resource_type.resource name.attribute
  tags = {
    Name = "MyTerraform"
	Owner = "Sreedhar"
  }
}
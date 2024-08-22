terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

#Configure the AWS provider
provider "aws" {
  region= "us-east-1" 

}

#
resource "aws_instance" "Test_EC2" {
   ami = "ami-0a0e5d9c7acc336f1"
   instance_type = "t2.micro"
   tags = {
    	   Name = "my-terra-instance"
  	   }
}

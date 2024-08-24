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

#Get the security group id
data "aws_security_group" "existing_sg"{
   name = "devops-bootcamp"
}

#Configure the Test EC2 Instance
resource "aws_instance" "Test_EC2_Terraform" {
   ami = "ami-0a0e5d9c7acc336f1"
   instance_type = "t2.micro"
   key_name = "ec2_jenkins-BC"
   vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
   tags = {
    	   Name = "Test_EC2_Terraform"
  	   }
}

#Configure the Prod EC2 Instance
resource "aws_instance" "Prod_EC2_Terraform" {
   ami = "ami-0a0e5d9c7acc336f1"
   instance_type = "t2.micro"
   key_name = "ec2_jenkins-BC"
   vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
   tags = {
    	   Name = "Prod_EC2_Terraform"
  	   }
}

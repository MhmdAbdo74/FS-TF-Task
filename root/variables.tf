variable "project_name" {}
variable "vpc_cidr" {}
variable "aws_region" {}
variable "pub_sub_1a_cidr" {}
variable "pub_sub_2b_cidr" {}
variable "my_ip" {}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}



variable "ebs_volume_size_gb" {
  
}
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


variable "project_name" {}
variable "my_ip" {}
variable "subnet_ids" {
  type = list(string)
}
variable "availability_zones" {
    type = list(string)

}
variable "vpc_id" {}
variable "pub_sub_1a_id" {}
variable "pub_sub_2b_id" {}
variable "ebs_volume_size_gb" {
  
}
module "vpc" {
  source          = "../modules/vpc"
  project_name    = var.project_name
  region          = var.aws_region
  vpc_cidr        = var.vpc_cidr
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_2b_cidr = var.pub_sub_2b_cidr
}
module "EC2" {
    source          = "../modules/EC2"
    project_name    = var.project_name
    my_ip           = var.my_ip
    instance_count  = var.instance_count
    instance_type   = var.instance_type
    ami_id          = var.ami_id
    key_name        = var.key_name
    availability_zones = module.vpc.availability_zones
 subnet_ids     = module.vpc.subnet_ids
vpc_id          = module.vpc.vpc_id 
  pub_sub_1a_id   = module.vpc.subnet_ids[0]
  pub_sub_2b_id   = module.vpc.subnet_ids[1]
ebs_volume_size_gb = var.ebs_volume_size_gb
}

module "EBS" {
  source = "../modules/EBS"
  project_name = var.project_name
  ebs_volume_size = var.ebs_volume_size_gb
  availability_zones = module.vpc.availability_zones
  instance_count = var.instance_count
  instance_ids = module.EC2.instance_ids 

}
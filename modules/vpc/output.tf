output "project_name" {
value = var.project_name  
}
output "region"{
value = var.region
} 
output "vpc_id"{
value = aws_vpc.vpc.id    
}
output "vpc_cidr" {
 value = var.vpc_cidr     
}

output "availability_zones" {
  value = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1]
  ]
}
output "subnet_ids" {
  value = [
    aws_subnet.pub_sub_1a.id,
    aws_subnet.pub_sub_2b.id
  ]
}

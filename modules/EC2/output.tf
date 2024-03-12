output "ebs_volume_size" {
    value = var.ebs_volume_size_gb
}
output "instance_count" { 
    value = var.instance_count
}
output "instance_ids" {
  value = aws_instance.ec2[*].id
}
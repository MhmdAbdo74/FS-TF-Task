resource "aws_ebs_volume" "ebs_volume" {
  count             = var.instance_count
  availability_zone = element(var.availability_zones, count.index)
  size              = var.ebs_volume_size
  tags = {
    Name = "${var.project_name}-ebs-${count.index}"
  }
}
resource "aws_volume_attachment" "ebs_attachment" {
  count       = var.instance_count
  device_name = "/dev/sdf"  # Modify this to match the desired device name
  instance_id = var.instance_ids[count.index]
  volume_id   = aws_ebs_volume.ebs_volume[count.index].id
}
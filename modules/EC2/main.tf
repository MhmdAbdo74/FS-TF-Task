#create security group for EC2 instances 
resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-ec2-sg"
  description = "Allow inbound traffic on port 22 and 80"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
    }
}
#create key that used for ssh 
resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("../modules/EC2/id_rsa.pub")
}
# create EC2 instances
resource "aws_instance" "ec2" {  
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key.key_name
  availability_zone = element(var.availability_zones, count.index)
  security_groups = [aws_security_group.ec2_sg.id]
  subnet_id         = element(var.subnet_ids, count.index)
  tags = {
    Name = "${var.project_name}-ec2-${count.index}"
  }
    root_block_device {
    volume_type = "gp2"  # Specify the volume type (e.g., gp2 for General Purpose SSD)
    volume_size = var.ebs_volume_size_gb  # Specify the volume size in GB
  }
}
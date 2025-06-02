resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_aws
  subnet_id                   = var.subnetid
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip
    
  tags = {
    Name = "mycart-server"
  }
}

locals {
  ec2_instance_name = "ec2-team-y"
  ebs_volume_name   = "ebs-volume-team-y"
}

resource aws_instance virtual_machine {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_instance_type
#  root_block_device {
#    delete_on_termination = true
#    encrypted             = true
#    volume_size           = var.vm_root_volume_size
#    volume_type           = var.vm_root_volume_type
#  }
  subnet_id   = aws_subnet.public_web_subnets.0.id
  tags        = merge({ Name = local.ec2_instance_name }, local.module_common_tags)
  volume_tags = merge({ Name = local.ebs_volume_name }, local.module_common_tags)
}

data aws_ami ubuntu {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

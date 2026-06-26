#########################################
# EC2 Instance
#########################################

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id

  key_name                    = var.key_name
  vpc_security_group_ids       = var.security_group_ids
  iam_instance_profile         = var.iam_instance_profile

  user_data_replace_on_change = true

  associate_public_ip_address  = var.associate_public_ip_address

  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.enable_detailed_monitoring
  disable_api_termination     = var.disable_api_termination

  user_data = var.user_data

  #########################################
  # Root Volume
  #########################################

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    encrypted             = true
  }

  #########################################
  # Instance Metadata Service (IMDSv2)
  #########################################

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  #########################################
  # Tags
  #########################################

  tags = merge(
    local.common_tags,
    {
      Name = var.instance_name
    }
  )
}
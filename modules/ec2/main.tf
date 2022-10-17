resource "aws_instance" "this" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.allow_vpn.id]
  subnet_id                   = var.subnet_id
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = local.user_data
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_security_group" "allow_vpn" {
  name        = var.security_group
  description = "security group for ${var.security_group}"


  vpc_id = var.vpc_id

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


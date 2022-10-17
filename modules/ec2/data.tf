data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

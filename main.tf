module "vpn" {
  source                      = "./modules/ec2"
  name                        = ""
  key_name                    = "" # add key name, not create automatic
  instance_type               = "t3.medium"  
  security_group              = "" # add security group name
  docker_compose_str          = var.docker_compose
  vpc_id                      = "" # get vpc id with data
  subnet_id                   = "" # get subnet id with data
  availability_zone           = "" # get availability zone with data
  associate_public_ip_address = true
}

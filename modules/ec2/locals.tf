locals {
  block_device_path = "/dev/sdh"
  user_data         = <<EOF
#!/bin/bash

# Enter to root user
sudo su

# Install Docker
sudo yum -y install docker

# Add Group membership for ec2-user and root
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker root

# Dowload Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Make File Docker Compose
cat >  ./docker-compose.yml <<-TEMPLATE
${var.docker_compose_str}
TEMPLATE

# Permission Socker Docker
sudo chmod 777 /var/run/docker.sock

# Start Service Docker
sudo service docker start

# Change to ec2-user
su ec2-user

# Symbolic Link to Work Docker Compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Enter root directory
cd /

# Init Docker-Compose
docker-compose up -d

EOF
}

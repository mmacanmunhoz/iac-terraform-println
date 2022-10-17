variable "docker_compose" {
  type    = string
  default = <<EOF
version: '3.4'

volumes:
  mongodb_data:
    driver: local
    name: pritunl_mongodb

services:
  mongodb:
    container_name: "pritunl_mongodb"
    image: "mongo:4.2"
    volumes:
      - "mongodb_data:/data/mongodb"
    ports:
      - "27017:27017"
    restart: "always"
  pritunl:
    container_name: "pritunl"
    depends_on:
      - "mongodb"
    devices:
      - "/dev/net/tun:/dev/net/tun"
    environment:
      - mongodb_host==mongodb://mongodb:27017/pritunl
      - MONGODB_URI=mongodb://mongodb:27017/pritunl
    image: "tarbase/pritunl"
    links:
      - "mongodb"
    ports:
      - "443:443"
      - "1194:1194/udp"
      - "1194:1194/tcp"
    privileged: true
    restart: "always"
EOF
}

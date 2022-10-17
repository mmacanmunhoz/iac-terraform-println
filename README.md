## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.46 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpn"></a> [vpn](#module\_vpn) | ./modules/ec2 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docker_compose"></a> [docker\_compose](#input\_docker\_compose) | n/a | `string` | `"version: '3.4'\n\nvolumes:\n  mongodb_data:\n    driver: local\n    name: pritunl_mongodb\n\nservices:\n  mongodb:\n    container_name: \"pritunl_mongodb\"\n    image: \"mongo:4.2\"\n    volumes:\n      - \"mongodb_data:/data/mongodb\"\n    ports:\n      - \"27017:27017\"\n    restart: \"always\"\n  pritunl:\n    container_name: \"pritunl\"\n    depends_on:\n      - \"mongodb\"\n    devices:\n      - \"/dev/net/tun:/dev/net/tun\"\n    environment:\n      - mongodb_host==mongodb://mongodb:27017/pritunln      - MONGODB_URI=mongodb://mongodb:27017/pritunln    image: \"tarbase/pritunl\"\n    links:\n      - \"mongodb\"\n    ports:\n      - \"443:443\"\n      - \"1194:1194/udp\"\n      - \"1194:1194/tcp\"\n    privileged: true\n    restart: \"always\"\n"` | no |

## Outputs

No outputs.

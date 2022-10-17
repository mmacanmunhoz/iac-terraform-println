variable "name" {
  description = "Name to be used on all resources"
  type        = string

}

variable "security_group" {
  description = "Description of security group"
  type        = string
  nullable    = true

}

variable "availability_zone" {
  description = "The availability zone for both the AWS instance and the EBS volume."
  type        = string

}

variable "tags" {
  description = "Tags to put on the EC2 instance"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Name of the SSH key to log in with"
  type        = string

}

variable "instance_type" {
  description = "The default AWS instance size to run these containers on"
  type        = string
}

variable "docker_compose_str" {
  description = "The entire docker compose file to write."
  type        = string
}

variable "subnet_id" {
  description = "The VPC subnet to launch the instance in"
  type        = string

}

variable "iam_instance_profile" {
  description = "The name of the IAM instance profile to give to the EC2 instance"
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address in the VPC"
  type        = bool
  default     = false

}

variable "vpc_id" {
  description = "Id vpc networking"
  type        = string
}
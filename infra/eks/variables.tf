variable "cluster_name" {
  default = "sherpany-polls"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "subnet_1_cidr" {
  default = "10.10.1.0/24"
}

variable "subnet_2_cidr" {
  default = "10.10.2.0/24"
}

variable "instance_type" {
  default = "t3.small"
}

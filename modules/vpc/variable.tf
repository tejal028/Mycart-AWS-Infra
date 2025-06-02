#Variable for  defining ip-range for VPC
variable "vpc_cidr" {
    type = string
}

#Variable for defining name for VPCs
variable "vpc_name" {
    type = string
}

variable "cidr_ip" {
    type = list(string)
}

variable "az_name" {
    type = list(string)
}

variable "public_rt_cidr" {
    type = string
}

variable "private_rt_cidr" {
    type = string
}
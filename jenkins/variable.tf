

variable "vpc_cidr" {
    type = string
    description = "cidr for vpc"
}

variable "subnet_cidr" {
  type = list(string)  
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}
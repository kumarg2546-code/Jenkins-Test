
variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "sg_id" {
    type = string
}

variable "subnets" {
    type = list(string)
}
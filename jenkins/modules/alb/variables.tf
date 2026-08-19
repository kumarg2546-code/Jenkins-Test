
variable "sg_id" {
    type = string
    description = "sg id for application load balancer"
}

variable "subnets" {
    type = list(string)
    description = "subnets for application load balancer"
}


variable "vpc_id" {
    type = string
    description = "vpc id for application load balancer"
}


variable "instances" {
    type = list(string)
    description = "instance id for target group attachments"
}

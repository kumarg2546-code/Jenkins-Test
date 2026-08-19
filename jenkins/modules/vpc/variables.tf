

variable "vpc_cidr" {
    type = string
    description = "cidr for vpc"
}

variable "subnet_cidr" {
    type = list(string)    
}

variable "subnet_names" {
    type = list(string) 
    default = ["publicsubnet1", "publicsubnet2"]   
}

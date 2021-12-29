variable "cidr_block" {
    type = list(string)
    default = ["172.20.0.0/16","172.20.10.0/24"]
}

variable "ports" {
    type = list(number)
    default = [22,80,443,8080,8081]
}

# ubuntu 18.04 [0] - Jenkins, Ansiblecontroller - amzlinux [1], Nexus Ubuntu [2], 
variable "ami" {
    type = list(string)
    default = ["ami-0e472ba40eb589f49","ami-0ed9277fb7eb570c9","ami-0affd4508a5d2481b"]
}

variable "instance_type" {
    type = list(string)
    default = ["t2.small","t2.medium"]
}

variable "instance_type_for_nexus" {
    type = string
    default = "t2.medium"
}

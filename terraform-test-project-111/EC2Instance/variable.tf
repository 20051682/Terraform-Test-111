variable "ami_id" {
  default = "ami-0a89fa9a6d8c7ad98"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = "string"
}

variable "key_name" {
    type = string
}


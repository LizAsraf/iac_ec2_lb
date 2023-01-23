variable "enviroment" {
  type        = string
}

variable "tags" {
  description = "Tags to set on the network variables."
  type        = map(string)
}

variable "vpcid" {
  description = "vpcid"
  type        = string
} 

variable "vpcname" {
  description = "vpcname"
  type        = string
}

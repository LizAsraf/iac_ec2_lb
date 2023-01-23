/* variable "enviroment" {
  type        = string
} */

/* variable "instances_per_subnet" {
  description = "instances per subnet"
  type        = number
} */
  /* default = 1 */

variable "tags" {
  description = "Tags to set on the computed variables."
  type        = map(string)
}

variable "listener" {
  description = "load balancers configuration"
  type        = map(string) 
  default = {
    port = "80"
    protocol = "HTTP"
  }
}

variable "target_group" {
  description = "Target group configuration"
  type        = map(string) 
  default = {
    port = "80"
    protocol = "HTTP"
  }
}

variable "instances_ids" {
  description = "instances_ids"
}

variable "keyname" {
  description = "key for the aws"
  type        = string
  default     = "lizasraf"
}

variable "vpcid" {
  description = "vpcid"
  type        = string
} 

variable "vpcname" {
  description = "vpcname"
  type        = string
}

variable "security_groups" {
  description = "security_groups"
}

variable "subnet" {
  description = "subnet"
  type        = list
}

/* variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
} */

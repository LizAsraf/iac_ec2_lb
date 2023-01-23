variable "enviroment" {
  type        = string
}

variable "tags" {
  description = "Tags to set on the computed variables."
  type        = map(string)
  default     = {
    bootcamp = "15"
    created_by = "liz.asraf"
    managed_by = "terraform"
  }
}

variable "subnet" {
  description = "subnet"
  type        = list
}

variable "role_arn" {
  description = "arn"
}

variable "blogapp-AmazonEKSClusterPolicy" {
  description = "blogapp-AmazonEKSClusterPolicy"
}

variable "nodes_arn" {
  description = "nodes_arn"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default = "t2.micro"
}

variable "blogapp-AmazonEKSWorkerNodePolicy" {
  description = "blogapp-AmazonEKSWorkerNodePolicy"

}

variable "blogapp-AmazonEKS_CNI_Policy" {
  description = "blogapp-AmazonEKS_CNI_Policy"
  
}

variable "blogapp-AmazonEC2ContainerRegistryReadOnly" {
  description = "blogapp-AmazonEC2ContainerRegistryReadOnly"  
}

variable "blogapp-AmazonEKSVPCResourceController" {
  description = "blogapp-AmazonEKSVPCResourceController"  
}
variable "aws_eks_cluster_name" {
  description = "Name of eks cluster"
}

variable "aws_region" {
  description = "AWS regrion"
}

variable "aws_vpc_cidr_block" {
  description = "cird range for vpc"
}

variable "aws_subnet_public_cidr_blocks" {
  type        = list(string)
  description = "CIDR ranges for public subnet"
  default     = ["10.0.0.0/19", "10.0.32.0/19"]
}

variable "aws_subnet_public_availability_zones" {
  type        = list(string)
  description = "AZ for public subnet"
  default     = ["us-east-1a", "us-east-1b"]
}


variable "aws_subnet_private_cidr_blocks" {
  type        = list(string)
  description = "CIDR ranges for private subnet"
  default     = ["10.0.64.0/19", "10.0.96.0/24"]
}

variable "aws_subnet_private_availability_zones" {
  type        = list(string)
  description = "AZ for private subnet"
  default     = ["us-east-1a", "us-east-1b"]
}


variable "aws_eks_node_group" {
  type = list(object({
    node_group_name = string
    instance_type   = string
    desired_size    = number
    max_size        = number
    min_size        = number
    max_unavailable = number
  }))
  description = "Configuration of EKS node group."
}
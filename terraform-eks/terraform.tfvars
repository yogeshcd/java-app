aws_eks_cluster_name = "demo"
aws_region           = "us-east-1"
aws_vpc_cidr_block   = "10.0.0.0/16"
aws_eks_node_group = [
  {
    node_group_name = "main-node-group"
    instance_type   = "t2.micro"
    desired_size    = 1
    max_size        = 2
    min_size        = 1
    max_unavailable = 1
  }
]
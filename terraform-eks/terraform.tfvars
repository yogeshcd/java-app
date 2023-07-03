aws_eks_cluster_name = "demo"
aws_region           = "us-east-1"
aws_vpc_cidr_block   = "10.0.0.0/16"
aws_eks_node_group = [
  {
    node_group_name = "main-node-group"
    instance_type   = "t3.medium"
    desired_size    = 2
    max_size        = 2
    min_size        = 2
    max_unavailable = 1
  }
]

# aws_eks_node_group.main: Still creating... [23m40s elapsed]
# ╷
# │ Error: waiting for EKS Node Group (demo:main-node-group) to create: unexpected state 'CREATE_FAILED', wanted target 'ACTIVE'. last error: 1 error occurred:
# │ 	* i-07f658afe2332e3f7: NodeCreationFailure: Instances failed to join the kubernetes cluster
# │ 
# │ 
# │ 
# │   with aws_eks_node_group.main,
# │   on 08-eks-node.tf line 43, in resource "aws_eks_node_group" "main":
# │   43: resource "aws_eks_node_group" "main" {




#   aws_eks_node_group.main: Still creating... [12m20s elapsed]
# ╷
# │ Error: waiting for EKS Node Group (demo:main-node-group) to create: unexpected state 'CREATE_FAILED', wanted target 'ACTIVE'. last error: 1 error occurred:
# │       * i-0d4530dcfda90634a: NodeCreationFailure: Instances failed to join the kubernetes cluster
# │ 
# │ 
# │ 
# │   with aws_eks_node_group.main,
# │   on 08-eks-node.tf line 43, in resource "aws_eks_node_group" "main":
# │   43: resource "aws_eks_node_group" "main" {
# │ 
# ╵
# yogeshgaikwad@OPLPT1073 terraform-eks % 
resource "aws_eks_cluster" "blogapp" {
  name     = "blogapp-liz"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    var.blogapp-AmazonEKSClusterPolicy,
    var.blogapp-AmazonEKSVPCResourceController,
  ]
  tags = merge(
    var.tags,
    {
      Name = "cluster-${var.enviroment}_${terraform.workspace}"
    },
  )
}

resource "aws_eks_node_group" "private-nodes" {
  cluster_name = aws_eks_cluster.blogapp.name
  node_group_name = "nodes-liz"
  node_role_arn = var.nodes_arn
  subnet_ids = var.subnet

  capacity_type = "ON_DEMAND"
  instance_types = [var.instance_type]

  scaling_config {
    desired_size = 3
    max_size = 5
    min_size = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }
  depends_on = [
  var.blogapp-AmazonEKSWorkerNodePolicy,
  var.blogapp-AmazonEKS_CNI_Policy, 
  var.blogapp-AmazonEC2ContainerRegistryReadOnly, 
  ]
  tags = merge(
    var.tags,
    {
      Name = "cluster-${var.enviroment}_${terraform.workspace}"
    },
  )
}
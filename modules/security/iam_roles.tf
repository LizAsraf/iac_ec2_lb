/* resource "aws_iam_role" "eks_cluster" {
  name = "eks_cluster-liz"
  tags = merge(
    var.tags,
    {
      Name = "${var.enviroment}-iam_role-liz"
      "kubernetes.io/role/internal-elb" = "1"
      "kubernetes.io/cluster/nodejs" = "owned"
    },
  ) 
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "nodejs-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks_cluster.name 
}
# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "nodejs-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster.name
}
resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role = aws_iam_role.eks_cluster.name
} 

resource "aws_iam_role" "nodes" {
  name = "eks_node_group_nodes-liz"
  tags = merge(
    var.tags,
    {
      Name = "${var.enviroment}-iam_role_nodes"
      "kubernetes.io/role/internal-elb" = "1"
      "kubernetes.io/cluster/nodejs" = "owned"
    },
  ) 
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodejs-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodejs-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodejs-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.nodes.name
}


resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy-node" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role = aws_iam_role.nodes.name
}  */
output "security_groups" {
  value = aws_security_group.tcp_ssh.id
}
/* output "role_arn" {
  value = aws_iam_role.eks_cluster.arn
}
output "blogapp-AmazonEKSClusterPolicy" {
  value = aws_iam_role_policy_attachment.blogapp-AmazonEKSClusterPolicy
}
output "nodes_arn" {
  value = aws_iam_role.nodes.arn
}

output "blogapp-AmazonEKSWorkerNodePolicy" {
  value = aws_iam_role_policy_attachment.blogapp-AmazonEKSWorkerNodePolicy.role
}

output "blogapp-AmazonEKS_CNI_Policy" {
  value = aws_iam_role_policy_attachment.blogapp-AmazonEKS_CNI_Policy.role
}

output "blogapp-AmazonEC2ContainerRegistryReadOnly" {
  value = aws_iam_role_policy_attachment.blogapp-AmazonEC2ContainerRegistryReadOnly.role
}

output "blogapp-AmazonEKSVPCResourceController" {
  value = aws_iam_role_policy_attachment.blogapp-AmazonEKSVPCResourceController
} */
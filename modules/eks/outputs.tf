output "cluster_endpoint" {
  value = aws_eks_cluster.blogapp.endpoint
}

output "cluster_name"{
  value = aws_eks_cluster.blogapp.name
}
output "certificate_authority"{
  value = aws_eks_cluster.blogapp.certificate_authority[0].data
}
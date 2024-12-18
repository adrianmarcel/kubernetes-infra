resource "aws_eks_node_group" "default" {
  cluster_name    = module.eks.cluster_name
  node_group_name = "default-node-group"
  node_role_arn   = aws_iam_role.eks_worker.arn
  subnet_ids      = module.eks.private_subnets
  instance_types  = ["t3.medium"]
  desired_size    = 2
  max_size        = 3
  min_size        = 1
}

resource "aws_iam_role" "eks_worker" {
  name = "eks_worker_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  node_groups = {
    default = {
      desired_capacity = var.node_count
      instance_type    = var.node_instance_type
    }
  }
}

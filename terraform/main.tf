provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "./eks"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  node_instance_type = var.node_instance_type
  node_count = var.node_count
}

module "alb" {
  source           = "./alb"
  cluster_name     = module.eks.cluster_name
  vpc_id           = module.eks.vpc_id
  subnets          = module.eks.private_subnets
  alb_ingress_name = "app-ingress"
}

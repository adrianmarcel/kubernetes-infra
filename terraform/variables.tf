variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "kubernetes_version" {
  default = "1.27"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "node_count" {
  default = 2
}

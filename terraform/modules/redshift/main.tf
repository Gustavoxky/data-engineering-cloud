resource "aws_redshift_cluster" "redshift" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password

  node_type       = "dc2.large"
  number_of_nodes = 2
}

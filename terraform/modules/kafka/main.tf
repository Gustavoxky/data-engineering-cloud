resource "aws_msk_cluster" "kafka" {
  cluster_name  = var.cluster_name
  kafka_version = "2.8.1"

  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    client_subnets  = var.subnets
    security_groups = var.security_groups
  }
}

output "kafka_bootstrap_servers" {
  value = aws_msk_cluster.kafka.bootstrap_brokers
}

output "emr_cluster_id" {
  value = aws_emr_cluster.spark_cluster.id
}

output "spark_master_public_dns" {
  value = aws_emr_cluster.spark_cluster.master_public_dns
}

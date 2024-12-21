output "redshift_cluster_id" {
  value = aws_redshift_cluster.redshift.cluster_identifier
}

output "redshift_endpoint" {
  value = aws_redshift_cluster.redshift.endpoint
}

output "redshift_port" {
  value = aws_redshift_cluster.redshift.port
}

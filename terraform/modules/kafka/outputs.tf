output "kafka_arn" {
  value = aws_msk_cluster.kafka.arn
}

output "kafka_brokers" {
  value = aws_msk_cluster.kafka.bootstrap_brokers
}

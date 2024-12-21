output "airflow_service_id" {
  value = aws_ecs_service.airflow_service.id
}

output "airflow_url" {
  value = tolist(aws_ecs_service.airflow_service.load_balancer)[0].dns_name
}

output "airflow_service_url" {
  value = tolist(aws_ecs_service.airflow_service.load_balancer)[0].dns_name
}

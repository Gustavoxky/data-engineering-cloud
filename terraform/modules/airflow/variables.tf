variable "cluster_name" {
  description = "Nome do cluster ECS para o Airflow"
  type        = string
}

variable "airflow_image" {
  description = "Imagem Docker para o Airflow"
  type        = string
}

variable "subnets" {
  description = "Subnets para o serviço ECS"
  type        = list(string)
}

variable "security_groups" {
  description = "Grupos de segurança para o ECS"
  type        = list(string)
}

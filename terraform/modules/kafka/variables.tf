variable "cluster_name" {
  description = "Nome do cluster Kafka"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets para Kafka"
  type        = list(string)
}

variable "security_groups" {
  description = "Grupos de segurança associados ao cluster Kafka"
  type        = list(string)
}

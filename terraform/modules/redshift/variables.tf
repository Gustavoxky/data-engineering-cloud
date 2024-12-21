variable "cluster_identifier" {
  description = "Identificador do cluster Redshift"
  type        = string
}

variable "database_name" {
  description = "Nome do banco de dados"
  type        = string
}

variable "master_username" {
  description = "Usuário mestre do cluster"
  type        = string
}

variable "master_password" {
  description = "Senha do usuário mestre"
  type        = string
}

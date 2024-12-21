variable "cluster_name" {
  description = "Nome do cluster EMR"
  type        = string
}

variable "key_name" {
  description = "Chave SSH para acessar instâncias do cluster"
  type        = string
}

variable "subnet_id" {
  description = "ID do subnet para o cluster EMR"
  type        = string
}

variable "master_instance_type" {
  description = "Tipo de instância para o nó master"
  type        = string
  default     = "m5.xlarge"
}

variable "core_instance_type" {
  description = "Tipo de instância para os nós core"
  type        = string
  default     = "m5.xlarge"
}

variable "core_instance_count" {
  description = "Número de instâncias no grupo core"
  type        = number
  default     = 2
}

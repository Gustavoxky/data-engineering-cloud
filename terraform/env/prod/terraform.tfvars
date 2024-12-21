# Configuração para o ambiente de produção

# Configurações do Spark (EMR)
cluster_name         = "prod-spark-cluster"
key_name             = "prod-keypair"
subnet_id            = "subnet-23456789"
master_instance_type = "m5.2xlarge"
core_instance_type   = "m5.2xlarge"
core_instance_count  = 5

# Configurações do Airflow
airflow_image   = "apache/airflow:2.5.0-python3.9"
subnets         = ["subnet-23456789", "subnet-98765432"]
security_groups = ["sg-23456789"]

# Configurações globais
region      = "us-east-1"
environment = "prod"

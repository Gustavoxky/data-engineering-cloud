# Configuração para o ambiente de desenvolvimento

# Configurações do Spark (EMR)
cluster_name         = "dev-spark-cluster"
key_name             = "dev-keypair"
subnet_id            = "subnet-12345678"
master_instance_type = "m5.large"
core_instance_type   = "m5.large"
core_instance_count  = 2

# Configurações do Airflow
airflow_image   = "apache/airflow:2.5.0-python3.9"
subnets         = ["subnet-12345678", "subnet-87654321"]
security_groups = ["sg-12345678"]

# Configurações globais
region      = "us-east-1"
environment = "dev"

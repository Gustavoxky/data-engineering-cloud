provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "data-engineering-pipeline"
}

module "redshift" {
  source             = "./modules/redshift"
  cluster_identifier = "data-warehouse-cluster"
  database_name      = "analytics"
  master_username    = "admin"
  master_password    = "SecurePass123!"
}

module "kafka" {
  source          = "./modules/kafka"
  cluster_name    = "data-stream-cluster"
  subnets         = ["subnet-12345678", "subnet-87654321"]
  security_groups = ["sg-12345678"]
}

module "airflow" {
  source          = "./modules/airflow"
  cluster_name    = "airflow-cluster"
  subnets         = ["subnet-12345678", "subnet-87654321"]
  security_groups = ["sg-12345678"]
  airflow_image   = "apache/airflow:2.5.0-python3.9"
}

module "spark" {
  source               = "./modules/spark"
  cluster_name         = "spark-cluster"
  subnet_id            = "subnet-12345678"
  key_name             = "your-ssh-key-name"
  master_instance_type = "m5.large"
  core_instance_type   = "m5.large"
  core_instance_count  = 2
}

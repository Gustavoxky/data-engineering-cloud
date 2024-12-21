from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
from utils.spark_helpers import run_spark_job
from utils.redshift_helpers import load_to_redshift

def process_data():
    """Função para processar dados do S3 usando Spark."""
    run_spark_job(
        input_path="s3://your-s3-bucket/raw/kafka_data.json",
        output_path="s3://your-s3-bucket/processed/cleaned_data.parquet"
    )

def load_data():
    """Função para carregar dados processados no Redshift."""
    load_to_redshift(
        table="processed_data",
        s3_path="s3://your-s3-bucket/processed/cleaned_data.parquet"
    )

default_args = {
    'owner': 'airflow',
    'retries': 3,
    'retry_delay': timedelta(minutes=10),
}

with DAG(
    dag_id='process_data_dag',
    default_args=default_args,
    start_date=datetime(2023, 1, 1),
    schedule_interval='@daily',
    catchup=False
) as dag:

    process_task = PythonOperator(
        task_id='process_data_task',
        python_callable=process_data
    )

    load_task = PythonOperator(
        task_id='load_data_task',
        python_callable=load_data
    )

    process_task >> load_task


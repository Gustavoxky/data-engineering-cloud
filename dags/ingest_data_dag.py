from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
from utils.s3_helpers import upload_to_s3
from utils.kafka_helpers import fetch_kafka_messages

def ingest_data():
    """Função para consumir dados do Kafka e salvá-los no S3."""
    kafka_messages = fetch_kafka_messages(topic="data-ingest-topic")
    upload_to_s3(data=kafka_messages, bucket="your-s3-bucket", key="raw/kafka_data.json")

default_args = {
    'owner': 'airflow',
    'retries': 3,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='ingest_data_dag',
    default_args=default_args,
    start_date=datetime(2023, 1, 1),
    schedule_interval='@hourly',
    catchup=False
) as dag:

    ingest_task = PythonOperator(
        task_id='ingest_data_task',
        python_callable=ingest_data
    )

from kafka import KafkaConsumer

def fetch_kafka_messages(topic, bootstrap_servers="localhost:9092"):
    """Consome mensagens de um tópico Kafka."""
    consumer = KafkaConsumer(
        topic,
        bootstrap_servers=bootstrap_servers,
        auto_offset_reset='earliest',
        enable_auto_commit=True,
        group_id='airflow-group'
    )
    messages = [msg.value.decode('utf-8') for msg in consumer]
    consumer.close()
    return messages

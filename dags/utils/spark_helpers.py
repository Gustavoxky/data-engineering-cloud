from pyspark.sql import SparkSession

def run_spark_job(input_path, output_path):
    """Executa um job Spark para processar dados."""
    spark = SparkSession.builder \
        .appName("Airflow Spark Job") \
        .getOrCreate()

    # Carregar dados
    df = spark.read.json(input_path)

    # Processar dados (exemplo simples)
    df_cleaned = df.dropna()

    # Salvar dados processados
    df_cleaned.write.parquet(output_path)
    print(f"Dados processados salvos em {output_path}")

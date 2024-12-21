from pyspark.sql import SparkSession

def process_data(input_path, output_path):
    spark = SparkSession.builder \
        .appName("Process Data Job") \
        .getOrCreate()

    # Carregar dados do S3
    df = spark.read.json(input_path)

    # Processar dados: Filtrar campos e remover valores nulos
    processed_df = df.filter("value IS NOT NULL").dropDuplicates()

    # Salvar dados processados de volta ao S3
    processed_df.write.mode("overwrite").parquet(output_path)

    print(f"Dados processados e salvos em {output_path}")

if __name__ == "__main__":
    import sys
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    process_data(input_path, output_path)

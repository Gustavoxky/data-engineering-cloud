from pyspark.sql import SparkSession

def clean_data(input_path, output_path):
    spark = SparkSession.builder \
        .appName("Clean Data Job") \
        .getOrCreate()

    # Carregar dados do S3
    df = spark.read.parquet(input_path)

    # Limpar dados: Remover valores nulos e registros duplicados
    cleaned_df = df.na.drop("any").dropDuplicates()

    # Salvar dados limpos
    cleaned_df.write.mode("overwrite").parquet(output_path)

    print(f"Dados limpos e salvos em {output_path}")

if __name__ == "__main__":
    import sys
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    clean_data(input_path, output_path)

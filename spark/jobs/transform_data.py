from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_date

def transform_data(input_path, output_path):
    spark = SparkSession.builder \
        .appName("Transform Data Job") \
        .getOrCreate()

    # Carregar dados limpos
    df = spark.read.parquet(input_path)

    # Transformar dados: Adicionar coluna de data formatada
    transformed_df = df.withColumn("formatted_date", to_date(col("timestamp"), "yyyy-MM-dd"))

    # Salvar dados transformados
    transformed_df.write.mode("overwrite").parquet(output_path)

    print(f"Dados transformados e salvos em {output_path}")

if __name__ == "__main__":
    import sys
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    transform_data(input_path, output_path)

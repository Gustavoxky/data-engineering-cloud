import psycopg2

def load_to_redshift(table, s3_path):
    """Carrega dados do S3 para uma tabela do Redshift."""
    conn = psycopg2.connect(
        dbname="your_db",
        user="your_user",
        password="your_password",
        host="your_redshift_endpoint",
        port="5439"
    )
    cur = conn.cursor()

    sql = f"""
    COPY {table}
    FROM '{s3_path}'
    IAM_ROLE 'your-iam-role'
    FORMAT AS PARQUET;
    """
    cur.execute(sql)
    conn.commit()
    cur.close()
    conn.close()
    print(f"Dados carregados na tabela {table}")

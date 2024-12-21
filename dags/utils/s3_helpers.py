import boto3
import json

def upload_to_s3(data, bucket, key):
    """Faz upload de dados para um bucket S3."""
    s3 = boto3.client('s3')
    s3.put_object(
        Bucket=bucket,
        Key=key,
        Body=json.dumps(data)
    )
    print(f"Dados enviados para s3://{bucket}/{key}")

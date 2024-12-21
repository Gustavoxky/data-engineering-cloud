data-engineering-project/
├── terraform/
│ ├── main.tf # Arquivo principal que invoca os módulos
│ ├── variables.tf # Variáveis globais
│ ├── outputs.tf # Saída de dados de toda a infraestrutura
│ ├── modules/ # Módulos reutilizáveis
│ │ ├── s3/ # Configuração para buckets S3
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ ├── kafka/ # Configuração do Apache Kafka (MSK ou outro)
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ ├── redshift/ # Configuração do cluster Redshift
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ ├── spark/ # Configuração de cluster Spark
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ └── airflow/ # Configuração para Airflow (via EC2 ou MWAA)
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── env/ # Diferentes ambientes (opcional)
│ │ ├── dev/
│ │ │ ├── terraform.tfvars # Configuração de ambiente de desenvolvimento
│ │ └── prod/
│ │ ├── terraform.tfvars # Configuração de ambiente de produção
│ └── scripts/ # Scripts auxiliares para provisionamento
│ ├── setup.sh # Script de setup inicial
│ ├── destroy.sh # Script para destruir recursos
│ └── deploy.sh # Script de deploy automatizado
├── dags/ # DAGs do Airflow
│ ├── ingest_data_dag.py # DAG para ingestão de dados (Kafka -> S3)
│ ├── process_data_dag.py # DAG para processamento (S3 -> Redshift via Spark)
│ └── utils/ # Funções utilitárias para os DAGs
│ ├── s3_helpers.py
│ ├── redshift_helpers.py
│ └── spark_helpers.py
├── spark/ # Configuração e scripts Spark
│ ├── jobs/
│ │ ├── process_data.py # Job Spark para processamento de dados
│ │ ├── clean_data.py # Job Spark para limpeza de dados
│ │ └── transform_data.py # Job Spark para transformação
│ ├── configs/
│ │ ├── spark-defaults.conf
│ │ └── log4j.properties
│ └── requirements.txt # Dependências Python para o Spark
├── data/ # Dados brutos e processados
│ ├── raw/ # Dados brutos (S3 simulada ou local)
│ ├── processed/ # Dados processados para análises
│ └── analytics/ # Dados prontos para o Redshift
├── docs/ # Documentação do projeto
│ ├── architecture-diagram.png # Diagrama da arquitetura
│ ├── readme.md # Documentação principal
│ └── setup-instructions.md # Instruções detalhadas de setup
└── .gitignore # Ignorar arquivos sensíveis no controle de versão

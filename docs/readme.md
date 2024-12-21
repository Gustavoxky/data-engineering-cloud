# Projeto de Engenharia de Dados

Este projeto configura um pipeline de dados escalável usando Terraform e ferramentas como Kafka, Spark, Airflow e Redshift.

## **Arquitetura**

O pipeline suporta:

- **Ingestão**: Kafka e S3.
- **Processamento**: Spark para limpeza e transformação.
- **Armazenamento**: Redshift para análises.
- **Orquestração**: Airflow para gerenciar workflows.

### **Diagrama de Arquitetura**

Confira o arquivo `architecture-diagram.png` nesta pasta.

---

## **Configuração**

1. **Pré-requisitos**:

   - Terraform instalado.
   - AWS CLI configurado.
   - Conta AWS com permissões para S3, EMR, Redshift e ECS.

2. **Instalação**:

   - Execute o script de configuração:
     ```bash
     ./scripts/setup.sh
     ```

3. **Deploy**:

   - Escolha o ambiente (`dev` ou `prod`):
     ```bash
     ./scripts/deploy.sh
     ```

4. **Destruição de Recursos**:
   - Para destruir recursos, use:
     ```bash
     ./scripts/destroy.sh
     ```

---

## **Estrutura do Projeto**

```plaintext
data-engineering-project/
├── terraform/       # Configuração da infraestrutura
├── dags/            # DAGs do Airflow
├── spark/           # Scripts Spark
├── data/            # Dados brutos e processados
├── docs/            # Documentação
└── scripts/         # Scripts utilitários
```

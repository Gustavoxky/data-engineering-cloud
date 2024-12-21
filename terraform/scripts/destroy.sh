#!/bin/bash

echo "=== Destruindo Recursos do Terraform ==="

# Validar diretório
if [ ! -f "terraform/main.tf" ]; then
    echo "Erro: Certifique-se de executar o script no diretório raiz do projeto!"
    exit 1
fi

# Perguntar ao usuário o ambiente (dev ou prod)
read -p "Informe o ambiente que deseja destruir (dev/prod): " ENVIRONMENT

# Definir variáveis de ambiente
ENV_FILE="env/$ENVIRONMENT/terraform.tfvars"
if [ ! -f "$ENV_FILE" ]; then
    echo "Erro: Arquivo de variáveis para o ambiente $ENVIRONMENT não encontrado!"
    exit 1
fi

# Executar Terraform
cd terraform
terraform init
terraform destroy -var-file="../$ENV_FILE" -auto-approve

echo "Recursos destruídos com sucesso!"

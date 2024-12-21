#!/bin/bash

echo "=== Setup Inicial do Ambiente ==="

# Atualizar pacotes
echo "Atualizando pacotes..."
sudo apt-get update && sudo apt-get upgrade -y

# Instalar Terraform
if ! [ -x "$(command -v terraform)" ]; then
    echo "Terraform não encontrado. Instalando..."
    wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip
    unzip terraform_1.5.7_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    rm terraform_1.5.7_linux_amd64.zip
else
    echo "Terraform já está instalado."
fi

# Instalar AWS CLI
if ! [ -x "$(command -v aws)" ]; then
    echo "AWS CLI não encontrado. Instalando..."
    sudo apt-get install awscli -y
else
    echo "AWS CLI já está instalado."
fi

# Validar instalação
echo "Verificando instalações..."
terraform -v
aws --version

echo "Setup concluído com sucesso!"

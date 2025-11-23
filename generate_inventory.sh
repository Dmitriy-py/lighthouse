#!/bin/bash

# Требуется jq для парсинга JSON
if ! command -v jq &> /dev/null
then
    echo "jq не найден. Пожалуйста, установите jq (например, sudo apt install jq)."
    exit 1
fi

TERRAFORM_DIR="./yc-infrastructure"
INVENTORY_FILE="./prod.yml"

# Проверяем, что состояние существует
if [ ! -f "$TERRAFORM_DIR/terraform.tfstate" ]; then
    echo "Ошибка: Terraform state файл не найден. Сначала выполните 'terraform apply' в $TERRAFORM_DIR."
    exit 1
fi

echo "---" > $INVENTORY_FILE
echo "# Этот файл сгенерирован автоматически из Terraform outputs" >> $INVENTORY_FILE
echo "all:" >> $INVENTORY_FILE
echo "  vars:" >> $INVENTORY_FILE

TERRAFORM_OUTPUT=$(terraform -chdir=$TERRAFORM_DIR output -json)
ANSIBLE_USER=$(echo $TERRAFORM_OUTPUT | jq -r '.ansible_user.value')

echo "    ansible_user: $ANSIBLE_USER" >> $INVENTORY_FILE
echo "    ansible_ssh_private_key_file: ~/.ssh/id_rsa" >> $INVENTORY_FILE
echo "" >> $INVENTORY_FILE

# Извлекаем и записываем данные для ClickHouse
echo "clickhouse:" >> $INVENTORY_FILE
CLICKHOUSE_PUB_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.clickhouse_public_ip.value')
CLICKHOUSE_PRIV_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.clickhouse_private_ip.value')
echo "  hosts:" >> $INVENTORY_FILE
echo "    clickhouse_host:" >> $INVENTORY_FILE
echo "      ansible_host: $CLICKHOUSE_PUB_IP" >> $INVENTORY_FILE
echo "      internal_ip: $CLICKHOUSE_PRIV_IP" >> $INVENTORY_FILE
echo "" >> $INVENTORY_FILE

# Извлекаем и записываем данные для Vector
echo "vector:" >> $INVENTORY_FILE
VECTOR_PUB_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.vector_public_ip.value')
VECTOR_PRIV_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.vector_private_ip.value')
echo "  hosts:" >> $INVENTORY_FILE
echo "    vector_host:" >> $INVENTORY_FILE
echo "      ansible_host: $VECTOR_PUB_IP" >> $INVENTORY_FILE
echo "      internal_ip: $VECTOR_PRIV_IP" >> $INVENTORY_FILE
echo "" >> $INVENTORY_FILE

# Извлекаем и записываем данные для Lighthouse
echo "lighthouse:" >> $INVENTORY_FILE
LIGHTHOUSE_PUB_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.lighthouse_public_ip.value')
LIGHTHOUSE_PRIV_IP=$(echo $TERRAFORM_OUTPUT | jq -r '.lighthouse_private_ip.value')
echo "  hosts:" >> $INVENTORY_FILE
echo "    lighthouse_host:" >> $INVENTORY_FILE
echo "      ansible_host: $LIGHTHOUSE_PUB_IP" >> $INVENTORY_FILE
echo "      internal_ip: $LIGHTHOUSE_PRIV_IP" >> $INVENTORY_FILE
echo "" >> $INVENTORY_FILE

echo "Инвентарь Ansible (prod.yml) успешно сгенерирован."
echo "ClickHouse Public IP: $CLICKHOUSE_PUB_IP (Internal: $CLICKHOUSE_PRIV_IP)"
echo "Lighthouse Public IP: $LIGHTHOUSE_PUB_IP (Internal: $LIGHTHOUSE_PRIV_IP)"
# Домашнее задание к занятию 3 «Использование Ansible»

## ` Дмитрий Климов `

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
2. При создании tasks рекомендую использовать модули: get_url, template, yum, apt.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия       LightHouse, запустить веб-сервер.
4. Подготовьте свой inventory-файл prod.yml.
5. Запустите ansible-lint site.yml и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом --check.
7. Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и    теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег 08-ansible-03-yandex на фиксирующий коммит, в ответ                 предоставьте ссылку на него.

## Ответ:

# Проект "Развертывание Мониторинговой Системы"

Этот проект демонстрирует использование Ansible для автоматизации развертывания компонентов системы мониторинга: ClickHouse (placeholder), Vector (placeholder) и LightHouse UI с Nginx.

## Структура проекта

├── ansible/ │ ├── lighthouse/ │ │ ├── .gitignore │ │ ├── prod.yml # Inventory file │ │ ├── site.yml # Основной Ansible Playbook │ │ ├── templates/ │ │ │ └── nginx_lighthouse.conf.j2 # Шаблон конфигурации Nginx │ │ ├── host_vars/ │ │ │ └── clickhouse_host.yml # Переменные для clickhouse_host (internal_ip) │ │ └── venv/ # Виртуальное окружение Python │ └── README.md # Описание проекта Ansible ├── terraform/ │ └── … # Terraform конфигурация (для инфраструктуры) └── README.md # Основной README проекта


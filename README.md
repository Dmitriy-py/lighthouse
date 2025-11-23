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

## Цель

Автоматизировать развертывание всей системы мониторинга, включая:
1.  Настройку ClickHouse (placeholder).
2.  Настройку Vector (placeholder) для отправки данных в ClickHouse.
3.  Развертывание LightHouse UI (веб-интерфейс) за Nginx, настроенного на использование внутреннего IP ClickHouse.

## Используемые технологии

*   **Ansible:** Для автоматизации развертывания и конфигурации.
*   **Nginx:** Веб-сервер для LightHouse UI.
*   **Git:** Для получения кода LightHouse UI.
*   **ClickHouse:** База данных (placeholder).
*   **Vector:** Инструмент для обработки и маршрутизации данных (placeholder).
*   **Python:** Язык, на котором написан Ansible.

## Процесс развертывания

1.  **Подготовка инфраструктуры:** (Предполагается, что Terraform был использован для создания VM и настройки сети).
2.  **Установка Ansible:** Локально на машине управления (`vm1`).
3.  **Настройка инвентарного файла (`prod.yml`)**: Определение хостов (`clickhouse_host`, `vector_host`, `lighthouse_host`) и их IP-адресов.
4.  **Написание Ansible Playbook (`site.yml`)**:
    *   Автоматизация установки Nginx и Git на `lighthouse_host`.
    *   Создание директории `/var/www/lighthouse`.
    *   Настройка Git для игнорирования возможных проблем с владением (`safe.directory`).
    *   Клонирование последней версии LightHouse UI из репозитория `Dmitriy-py/lighthouse`.
    *   Конфигурирование `app.js` LightHouse для подключения к ClickHouse, используя внутренний IP.
    *   Копирование и включение конфигурации Nginx для LightHouse UI.
    *   Удаление стандартной конфигурации Nginx.
    *   Убеждение, что Nginx запущен и включен.
5.  **Проверка идемпотентности**: Запуск Playbook несколько раз для гарантии, что он не вносит изменений, если система уже настроена.
6.  **Верификация**: Проверка работы LightHouse UI в браузере.
7.  **Фиксация изменений в Git**: Сохранение всей конфигурации Ansible с тегированием.

## Результат

<img width="1920" height="1080" alt="Снимок экрана (1924)" src="https://github.com/user-attachments/assets/3eafa7be-5d4e-472e-b054-46bb673f62de" />

<img width="1920" height="1080" alt="Снимок экрана (1925)" src="https://github.com/user-attachments/assets/517b87f4-6e57-4a39-bae9-598e9ad8988d" />


<img width="1920" height="1080" alt="Снимок экрана (1943)" src="https://github.com/user-attachments/assets/a1347bc9-0ad0-453f-a45d-890d00a56c80" />

<img width="1920" height="1080" alt="Снимок экрана (1926)" src="https://github.com/user-attachments/assets/3b612900-5b26-4c8c-95e7-fdc33fa70d00" />

<img width="1920" height="1080" alt="Снимок экрана (1931)" src="https://github.com/user-attachments/assets/5f72576a-05f7-4df6-8227-f9a8e600b1f5" />

<img width="1920" height="1080" alt="Снимок экрана (1932)" src="https://github.com/user-attachments/assets/ee9bba0e-0464-4b11-9a2c-b9ad4742ab85" />

<img width="1920" height="1080" alt="Снимок экрана (1940)" src="https://github.com/user-attachments/assets/17f11923-3bd1-494d-8bc2-19fc65f4dfd7" />

<img width="1920" height="1080" alt="Снимок экрана (1941)" src="https://github.com/user-attachments/assets/a850837f-e89c-445b-a130-94bf41f5add9" />

<img width="1920" height="1080" alt="Снимок экрана (1942)" src="https://github.com/user-attachments/assets/8dd1bf2a-b706-4443-a0e0-f4da3b3ef2d5" />

После успешного выполнения Ansible Playbook, LightHouse UI доступен по публичному IP-адресу вашего хоста Lighthouse (например, `http://<Public_IP_Lighthouse>/`). Интерфейс корректно отображает данные и настроен для работы с ClickHouse.

<img width="1920" height="1080" alt="Снимок экрана (1937)" src="https://github.com/user-attachments/assets/6d7b5530-7595-4ae9-b55e-51c9283ea52a" />

<img width="1920" height="1080" alt="Снимок экрана (1938)" src="https://github.com/user-attachments/assets/40d14771-52d7-4f90-bba4-a2c214f29337" />

<img width="1920" height="1080" alt="Снимок экрана (1939)" src="https://github.com/user-attachments/assets/71448aa5-789d-486f-9cff-85220ff48efb" />

## Ссылка: https://github.com/VKCOM/lighthouse/commit/c49e1de707b256f79854594eab843965a2dd0bfd



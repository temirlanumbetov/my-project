# 🚀 CI/CD Pipeline для автоматического развертывания веб-приложения

[![Jenkins](https://img.shields.io/badge/CI-CD-Jenkins-red)]()
[![Docker](https://img.shields.io/badge/Container-Docker-blue)]()
[![Ansible](https://img.shields.io/badge/IaC-Ansible-black)]()
[![Linux](https://img.shields.io/badge/OS-Ubuntu-orange)]()
[![Status](https://img.shields.io/badge/Проект-Готов-brightgreen)]()

---

# 📌 Описание проекта

Данный проект демонстрирует полный цикл **CI/CD пайплайна** для автоматического развёртывания веб-приложения в контейнеризированной среде.

В проекте используется подход **Infrastructure as Code (IaC)** и автоматизация всех этапов доставки приложения.

---

# 🏗 Архитектура решения

```text id="arch_ru"
Автор → GitLab → Jenkins → Ansible → VM (Ubuntu)
                                      ↓
                                  Docker Engine
                                      ↓
                               Apache контейнер
                                      ↓
                           Скрипт мониторинга системы на VM2

⚙️ Используемые технологии
Технология	Назначение
Jenkins	    CI/CD автоматизация
Ansible	    Настройка сервера (IaC)
Docker	    Контейнеризация
Ubuntu	    Целевая ОС (VM1, VM2)
Bash	      Скрипты мониторинга VM2
Apache2	    Веб-сервер
Git/GitHub	Контроль версий

Структура проекта
my-project/
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── inventory/
│   └── hosts
│
├── playbooks/
│   └── docker_install.yml
│
├── scripts/
│   └── sysinfo.sh
│
├── Jenkinsfile
├── ansible.cfg
└── README.md

🔄 Этапы CI/CD пайплайна
1️⃣ Получение кода (Checkout)

Jenkins забирает последнюю версию проекта из репозитория.
<img width="1872" height="945" alt="stages" src="https://github.com/user-attachments/assets/042408bb-b300-4484-9702-eaffab4fb244" />

2️⃣ Установка Docker через Ansible
<img width="1066" height="92" alt="docker ps" src="https://github.com/user-attachments/assets/3788426c-2be1-4f80-b664-17ba06b27e26" />

Автоматическая настройка сервера:
<img width="1432" height="797" alt="inst" src="https://github.com/user-attachments/assets/d9c44263-9c73-431d-bf1d-1efa673695a1" />

установка Docker
настройка окружения
подготовка VM к деплою
ansible-playbook -i inventory/hosts playbooks/docker_install.yml
3️⃣ Сборка Docker образа
<img width="1417" height="761" alt="1" src="https://github.com/user-attachments/assets/ff837ae7-be99-4150-a276-97ef7e7813a0" />

docker build -t apache-app ./app
4️⃣ Запуск контейнера
<img width="1412" height="380" alt="22" src="https://github.com/user-attachments/assets/093f0c35-2e8e-41ad-b9c6-6b4d72fb6b44" />

docker rm -f app || true
docker run -d -p 80:80 --name app apache-app
5️⃣ Мониторинг системы
<img width="1886" height="900" alt="33" src="https://github.com/user-attachments/assets/f77bb9c7-fefd-4868-a795-4911ee1c67a4" />

Bash-скрипт собирает:

загрузку CPU
использование RAM
формирует HTML отчёт
<img width="817" height="407" alt="Снимок экрана 2026-05-10 224054" src="https://github.com/user-attachments/assets/26978134-6a6e-4ba3-bfab-2cf78f6abbd5" />

🎯 Что демонстрирует проект
CI/CD автоматизация
Infrastructure as Code (IaC)
Docker контейнеризация
Linux администрирование
Jenkins pipeline разработка
Bash мониторинг системы

👤 Автор

Temirlan Umbetov

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
https://github.com/temirlanumbetov/my-project/blob/14e4218ea09a4c5a274d60283c797b56cff90011/images/22.png
🔄 Этапы CI/CD пайплайна
1️⃣ Получение кода (Checkout)

Jenkins забирает последнюю версию проекта из репозитория.
![Jenkins](images/jenkins-pipeline.png)

2️⃣ Установка Docker через Ansible
<img width="1066" height="92" alt="docker ps" src="https://github.com/user-attachments/assets/3788426c-2be1-4f80-b664-17ba06b27e26" />

Автоматическая настройка сервера:
![Ansible](images/ansible.png)

установка Docker
настройка окружения
подготовка VM к деплою
ansible-playbook -i inventory/hosts playbooks/docker_install.yml
3️⃣ Сборка Docker образа
![Docker](images/docker.png)

docker build -t apache-app ./app
4️⃣ Запуск контейнера
<img width="1412" height="380" alt="22" src="https://github.com/user-attachments/assets/093f0c35-2e8e-41ad-b9c6-6b4d72fb6b44" />

docker rm -f app || true
docker run -d -p 80:80 --name app apache-app
5️⃣ Мониторинг системы
<img width="1886" height="900" alt="33" src="https://github.com/user-attachments/assets/f77bb9c7-fefd-4868-a795-4911ee1c67a4" />
images/22.png
Bash-скрипт собирает:
images/22.png
загрузку CPU
использование RAM
формирует HTML отчёт
![Report](images/report.png)

🎯 Что демонстрирует проект
CI/CD автоматизация
Infrastructure as Code (IaC)
Docker контейнеризация
Linux администрирование
Jenkins pipeline разработка
Bash мониторинг системы

👤 Автор

Temirlan Umbetov

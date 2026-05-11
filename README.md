# 🚀 CI/CD Pipeline для автоматического развертывания веб-приложения


---

# 📌 Описание проекта

Данный проект демонстрирует полный цикл **CI/CD пайплайна** для автоматического развёртывания веб-приложения в контейнеризированной среде.

В проекте используется подход **Infrastructure as Code (IaC)** и автоматизация всех этапов доставки приложения.

ТЗ проекта:

🖥️ Инфраструктура

Создать 2 виртуальные машины на базе Linux.
VM1 — CI/CD сервер
VM2 — сервер приложения

⚙️ Требования
- VM1
Установить и настроить:
Jenkins
Ansible
Репозиторий GitLab должен содержать:
inventory
playbooks
Jenkinsfile
Dockerfile
shell-скрипт
- VM2
Развернуть:
Linux
Docker
🔄 CI/CD pipeline (Jenkins)
Pipeline должен выполнять следующие этапы:

Stage 1
получение кода из GitLab
запуск Ansible playbook для установки Docker на VM2

Stage 2
сборка Docker image

Stage 3
запуск Docker container с Apache сервером

Stage 4
выполнение shell-скрипта, который:
собирает данные CPU и RAM
формирует ASCII-таблицу
сохраняет результат в HTML файл

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
```
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

<img width="1897" height="942" alt="Image" src="https://github.com/user-attachments/assets/7b018c2f-bff5-49d3-aa4b-bacbb69da57f" />

docker build -t apache-app ./app

4️⃣ Запуск контейнера
<img width="1412" height="380" alt="22" src="https://github.com/user-attachments/assets/093f0c35-2e8e-41ad-b9c6-6b4d72fb6b44" />

docker rm -f app || true
docker run -d -p 80:80 --name app apache-app

5️⃣ Мониторинг системы


Bash-скрипт собирает:

загрузку CPU
использование RAM
формирует HTML отчёт

<img width="1865" height="551" alt="image" src="https://github.com/user-attachments/assets/70208e55-8beb-4e92-a2b6-0992cc4312a3" />
<img width="817" height="407" alt="Image" src="https://github.com/user-attachments/assets/6033ecaa-8ef1-453e-b632-413d1075a3ca" />

🎯 Что демонстрирует проект

CI/CD автоматизация

Infrastructure as Code (IaC)

Docker контейнеризация

Linux администрирование

Jenkins pipeline разработка

Bash мониторинг системы


👤 Автор

Temirlan Umbetov

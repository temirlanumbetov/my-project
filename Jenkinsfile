pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@gitlab.com:my-group9413119/my-project.git'
            }
        }

        stage('Install Docker (Ansible)') {
            steps {
                sh "ansible-playbook -i inventory/hosts playbooks/docker_install.yml"
            }
        }

        stage('Build Docker') {
            steps {
                sh "docker build -t apache-app ./app"
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run -d -p 80:80 --name app apache-app"
            }
        }

        stage('System Script') {
            steps {
                sh "chmod +x scripts/sysinfo.sh && ./scripts/sysinfo.sh"
            }
        }
    }
}

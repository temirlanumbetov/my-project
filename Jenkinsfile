pipeline {
    agent any

    environment {
        ANSIBLE_HOST_KEY_CHECKING = "False"
        HOME = "/home/temirlan"
        ANSIBLE_PRIVATE_KEY_FILE = "/home/temirlan/.ssh/id_ed25519"
        ANSIBLE_REMOTE_TMP = "/tmp/.ansible"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@gitlab.com:my-group9413119/my-project.git'
            }
        }

        stage('Install Docker (Ansible)') {
            steps {
                sh '''
                mkdir -p /tmp/.ansible

                ANSIBLE_LOCAL_TEMP=/tmp/.ansible \
                ANSIBLE_REMOTE_TMP=/tmp/.ansible \
                HOME=/tmp \
                ansible-playbook -i inventory/hosts playbooks/docker_install.yml
                '''
            }
        } 

        stage('Build Docker') {
            steps {
                sh '''
                docker build -t apache-app ./app
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                sudo docker rm -f app || true
                sudo docker run -d -p 80:80 --name app apache-app
                '''
            }
        }

        stage('System Script') {
            steps {
                sh '''
                chmod +x scripts/sysinfo.sh
                ./scripts/sysinfo.sh
                '''
            }
        }
    }
}

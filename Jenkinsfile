pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Fetch Server IP') {
            steps {
                script {
                    def server_ip = sh(script: "terraform output -raw server_ip", returnStdout: true).trim()
                    writeFile file: 'inventory', text: "[web]\n${server_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem"
                }
            }
        }
        stage('Run Ansible') {
            steps {
                sh 'ansible-playbook -i inventory playbook.yml'
            }
        }
    }
}


pipeline {
    agent any

    environment {
        IMAGE_NAME = "ahmednasr/my-node-app"
        KUBE_CONFIG = "$HOME/.kube/config"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/AhmedNasr811/eyego.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker push $IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}

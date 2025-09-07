pipeline {
    agent any
    environment {
        KUBECONFIG = "/home/jenkins/.kube/config"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', credentialsId: 'dsad', url: 'https://github.com/charanrajkumar-ge/simple-java-maven-app.git''
            }
        }
        stage('Deploy to Minikube') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
        stage('Verify Deployment') {
            steps {
                script {
                    sh 'kubectl get pods'
                    sh 'kubectl get svc'
                }
            }
        }
    }
}

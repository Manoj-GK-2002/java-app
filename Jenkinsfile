pipeline {
    agent any

    tools {
        jdk 'OpenJDK11'
        maven 'maven'
    }

    environment {
        DOCKER_REGISTRY = "docker.io/manojgk1089"
        IMAGE_NAME = "shopping-cart-new"
        VERSION = "latest"  // Replace with dynamic version if needed
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'master', credentialsId: 'dsad', url: 'https://github.com/Manoj-GK-2002/java-app.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh "mvn sonar:sonar"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${VERSION} -f Dockerfile .
                """
            }
        }

        stage('Login and Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                    echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin
                    docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${VERSION}
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Build and Docker image push completed successfully."
        }
        failure {
            echo "Build or Docker image push failed."
        }
    }
}

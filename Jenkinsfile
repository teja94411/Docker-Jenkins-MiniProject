pipeline {
    agent any 
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-container-hub-cred'
        IMAGE_NAME = 'tejaroyal/java-app'
    }
    stages {
        stage('checkout') {
            steps {
                bat 'git checkout main'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID]) {
                    bat 'docker login'
                }
            }
        }
        
        stage('Push Image') {
            steps {
                bat "docker push %IMAGE_NAME%"
            }
        }

        stage('Run Container') {
            steps {
                bat "docker run -d %IMAGE_NAME%"
            }
        }
    }
        
    post {
        success {
            echo 'pipeline executed successfully'
        }
        failure {
            echo 'pipeline failed. Please check logs..'
        }
    }
}

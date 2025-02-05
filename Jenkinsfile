pipeline {
    agent any 
        environment{
            DOCKER_CREDENTIALS_ID = 'docker-container-hub-cred'
            IMAGE_NAME = 'tejaroyal/java-app'
        }
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/teja94411/Docker-Jenkins-MiniProject']])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        // For Unix-based systems (Linux/macOS)
                        sh 'docker build -t $IMAGE_NAME .'

                    } else {
                        // For Windows-based systems
                        bat "docker build -t %IMAGE_NAME% ."
                    }
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    if (isUnix()) {
                        // For Unix-based systems (Linux/macOS)
                        withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID]) {
                            sh 'docker login'
                        }
                    } else {
                        // For Windows-based systems
                        withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID]) {
                            bat 'docker login'
                        }
                    }
                }
            }
        }
        
        stage('Push Image') {
            steps {
                script {
                    if (isUnix()) {
                        // For Unix-based systems (Linux/macOS)
                        sh "docker push ${IMAGE_NAME}"
                    } else {
                        // For Windows-based systems
                        bat "docker push %IMAGE_NAME%"
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    if (isUnix()) {
                        // For Unix-based systems (Linux/macOS)
                        sh "docker run ${IMAGE_NAME}"
                    } else {
                        // For Windows-based systems
                        bat "docker run -d %IMAGE_NAME%"
                    }
                }
            }
        }
    }
        
        post {
            success {
                echo 'pipeline executed successfully'
            }
            failure {
                echo 'pipeline failed.Please check logs..'
            }
        }
}

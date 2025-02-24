pipeline {
    agent any 
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-container-hub-cred'
        IMAGE_NAME = 'tejaroyal/java-app'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '3f601ce9-7463-4bde-bf20-ca21df940366', url: 'https://github.com/teja94411/Docker-Jenkins-MiniProject.git']])
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh "docker build -t $IMAGE_NAME ."
                    } else {
                        bat "docker build -t %IMAGE_NAME% ."
                    }
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-container-hub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        if (isUnix()) {
                            sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        } else {
                            bat '''
                                echo %DOCKER_PASS% > pass.txt
                                docker login -u %DOCKER_USER% --password-stdin < pass.txt
                                del pass.txt
                            '''
                        }
                    }
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh "docker push $IMAGE_NAME"
                    } else {
                        bat "docker push %IMAGE_NAME%"
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh "docker run -d $IMAGE_NAME"
                    } else {
                        bat "docker run -d %IMAGE_NAME%"
                    }
                }
            }
        }
    }
        
    post {
        success {
            echo 'Pipeline executed successfully'
        }
        failure {
            echo 'Pipeline failed. Please check logs.'
        }
    }
}

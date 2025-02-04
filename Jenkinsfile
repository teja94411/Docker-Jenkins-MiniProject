pipeline {
    agent any 
        environment{
            DOCKER_CREDENTIALS_ID = 'docker-container-hub-cred'
            IMAGE_NAME = 'tejaroyal/java-app'
        }
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/teja94411/Maven-Project']])
            }
        }
        stage('build docker image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .' // For Windows
                # sh './build_docker_image.sh' // For ShellScript
            }
        }
        stage('login to docker hub') {
            steps {
                script {
                    // Correct usage of withDockerRegistry with a body to handle login
                    withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID]) {
                        bat 'docker login' // For Windows
                        # sh 'docker login' // For ShellScript
                    }
                }
            }
        }
        stage('push image') {
            steps {
                bat 'docker push %IMAGE_NAME%' // For Windows
                # sh 'docker push ${IMAGE_NAME}' // For ShellScript
            }
        }
        stage('run container') {
            steps {
                script {
                    bat 'docker run %IMAGE_NAME%' // For Windows
                   # sh 'docker run ${IMAGE_NAME}' // For ShellScript
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

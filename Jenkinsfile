pipeline {
    agent any  // Runs on any available Jenkins agent

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/teja94411/Maven-Project.git'  // Replace with your repo URL
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'  // For Windows
                // OR use: sh 'mvn clean package'  (For Linux/Mac)
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'  // Runs unit tests
            }
        }
    }
}

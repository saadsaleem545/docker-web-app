pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t docker-web-app:jenkins .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f jenkins-test || true'
                sh 'docker run -d --name jenkins-test -p 8082:80 docker-web-app:jenkins'
            }
        }

        stage('Test Application') {
            steps {
                sh 'sleep 5'
                sh 'curl -f http://jenkins-test'
            }
        }
    }

    post {
        always {
            sh 'docker rm -f jenkins-test || true'
        }
    }
}
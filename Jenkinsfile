pipeline {
    agent any

stages {

    stage('Build Docker Image') {
        steps {
            sh 'docker build -t docker-web-app:jenkins .'
        }
    }

    stage('Run Test Container') {
        steps {
            sh 'docker rm -f jenkins-test || true'
            sh 'docker run -d --name jenkins-test --network jenkins-network docker-web-app:jenkins'
        }
    }

    stage('Test Application') {
        steps {
            sh 'sleep 5'
            sh 'curl -f http://jenkins-test'
        }
    }

    stage('Deploy') {
        steps {
            sh 'docker rm -f docker-web-app-prod || true'
            sh 'docker run -d --name docker-web-app-prod -p 8082:80 docker-web-app:jenkins'
        }
    }
}

post {
    always {
        sh 'docker rm -f jenkins-test || true'
    }
}
}
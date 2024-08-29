pipeline {
    agent {
        label 'server1-abdullah'
        }

    tools {
        nodejs 'nodejs'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', credentialsId: '3c21348d-7801-4902-a977-bddd5783759b', url: 'https://github.com/Moys17-sys/simple-apps.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
                sh '''cd apps
                sonar-scanner \
                -Dsonar.projectKey=simple-apps \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://172.23.10.30:9000 \
                -Dsonar.login=sqp_c5eb4c45a5c004d5cac45314aaae93748e7fe570'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose down --volumes
                docker compose up -d
                '''
            }
        }
    }
}
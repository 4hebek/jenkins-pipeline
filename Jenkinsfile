pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Build stage running"'
                sh 'ls -la'
                sh 'touch build.txt'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Test stage running"'
                sh 'pwd'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploy stage running"'
                sh 'mv build.txt deployed.txt'
                sh 'ls -la'
            }
        }
    }
}
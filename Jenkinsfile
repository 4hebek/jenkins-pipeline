pipeline {
    agent any

    stages {
        stage('Cleanup') {
            steps {
                sh '''
                docker rm -f task1-app nginx-proxy || true
                docker network rm task1-network || true
                '''
            }
        }

        stage('Setup Network') {
            steps {
                sh 'docker network create task1-network'
            }
        }

        stage('Build Images') {
            steps {
                sh 'docker build -t task1-app .'
                sh 'docker build -f Dockerfile.nginx -t task1-nginx .'
            }
        }

        stage('Run Containers') {
            steps {
                sh '''
                docker run -d --name task1-app --network task1-network -p 5500:5500 task1-app
                docker run -d --name nginx-proxy --network task1-network -p 80:80 task1-nginx
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
                sh 'curl localhost || true'
                sh 'curl localhost:5500 || true'
            }
        }
    }
}
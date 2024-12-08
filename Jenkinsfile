pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Java Application') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tech365/my-java-app:v9 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_LOGIN', variable: 'DOCKER_TOKEN')]) {
                    sh """
                        echo $DOCKER_TOKEN | docker login -u your-docker-username --password-stdin
                        docker push tech365/my-java-app:v9
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }

        failure {
            echo 'Build or deployment failed.'
        }
    }
}

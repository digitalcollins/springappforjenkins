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
                // Use credentials for Docker login (username and password)
                withCredentials([usernamePassword(credentialsId: 'DOCKER_LOGIN', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh """
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
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

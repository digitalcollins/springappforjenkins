pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'digitalcollins/my-java-app:v1'
    }

    stages {
        stage('Build Docker image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_LOGIN', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        // Login to Docker using the credentials
                        sh '''
                            echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin
                        '''
                        
                        // Push the image to Docker registry
                        sh '''
                            docker push $DOCKER_IMAGE
                        '''
                    }
                }
            }
        }
    }
}

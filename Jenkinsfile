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
                    docker push digitalcollins/my-java-app:v1
                '''
            }
        }
    }
}

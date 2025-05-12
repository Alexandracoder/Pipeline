pipeline {
    agent any

    environment {
        IMAGE_NAME = 'alexandracoder/test-image'
    }

    stages {
        stage('Checkout') {
            steps {
                        git credentialsId: 'Credencial-Git', url: 'https://github.com/Alexandracoder/Pipeline.git', branch: 'main'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Docker Tag') {
            steps {
                script {
                    def tag = "latest"
                    sh "docker tag $IMAGE_NAME $IMAGE_NAME:$tag"
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker push $IMAGE_NAME:latest"
                    }
                }
            }
        }
    }

    post {
        success {
            echo '🚀 La imagen Docker se construyó y subió correctamente.'
        }
        failure {
            echo '❌ El pipeline falló. Revisa los logs para más detalles.'
        }
    }
}


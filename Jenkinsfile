pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Alexandracoder/Pipeline.git', branch: 'main', credentialsId: 'Credencial-Git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Construcción del proyecto Java usando Maven o Gradle
                    sh 'mvn clean install'  // Si usas Maven
                    // sh 'gradle build'    // Si usas Gradle
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Construcción de la imagen Docker
                    sh 'docker build -t alexandracoder/test-image .'
                }
            }
        }

        stage('Docker Tag') {
            steps {
                script {
                    // Etiquetado de la imagen Docker (si es necesario)
                    sh 'docker tag alexandracoder/test-image alexandracoder/test-image:latest'
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Subir la imagen Docker al repositorio
                    sh 'docker push alexandracoder/test-image'
                }
            }
        }
    }

    post {
        always {
            echo '❌ El pipeline falló. Revisa los logs para más detalles.'  // Mensaje si el pipeline falla
        }
    }
}


pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "mahmoudali66/java-hello:latest"
    }

    stages {
        stage('Build Jar') {
            steps {
                echo "Compiling Java Program..."
                bat 'javac App.java'
                bat 'jar cfe app.jar App App.class'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image..."
                bat "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker Image..."
                bat "docker push ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            cleanWs()
        }
    }
}

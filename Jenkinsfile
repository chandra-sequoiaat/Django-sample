pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'django_project'
        REGISTRY_CREDENTIALS = 'dockerhub-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.IMAGE_NAME)
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.REGISTRY_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        docker.withRegistry('https://hub.docker.com/', 'docker-hub-credentials') {
                            docker.image(env.IMAGE_NAME).push()
                        }
                    }
                }
            }
        }

        stage('Deploy to Dev') {
            when {
                branch 'develop'
            }
            steps {
                script {
                    // Add deployment steps for the development environment
                    // For example, use docker-compose to start the application with multiple services
                    // Or deploy to a Kubernetes cluster
                }
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Add deployment steps for the production environment
                }
            }
        }
    }
}

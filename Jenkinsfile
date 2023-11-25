pipeline {
    
    stages {
        
        stage('code') {  
            steps {
                git  branch: 'master', url: 'https://github.com/chandra-sequoiaat/Django-sample.git' 
            }  
        }

        stage('build') {  
            steps {
                script {
                    sh "docker build -t django_project ."
                } 
            }  
        }

        stage('deploy') {  
            steps {
                script {
                    sh "docker run -it -p 8000:8000 django_project"
                } 
            }  
        }
        
    }
}
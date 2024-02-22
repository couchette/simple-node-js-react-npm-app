pipeline {
    agent {
        docker {
            image 'node:20' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Initialize'){
            steps {
                def dockerHome = tool 'docker'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
            }
        }
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}
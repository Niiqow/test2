pipeline {
    agent any

    tools {
        nodejs "node"
    }

    stages {
        stage('Checkout code') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[credentialsId: '', 
                    url: 'https://github.com/Niiqow/test2.git']]
                ])
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
               
            }
        }

        stage('Docker build') {
            steps {
                sh 'docker build -t jenkins/jenkins:lts .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'docker push jenkins/jenkins:lts'
            }
        }

        stage('Deploy to production') {
            steps {
                sh 'docker run -d -p 80:80 jenkins/jenkins:lts'
            }
        }
    }
}

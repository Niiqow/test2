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

        stage('Deploy') {
            steps {
                sh 'npm start'
            }
        }
    }
}

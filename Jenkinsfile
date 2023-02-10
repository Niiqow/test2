pipeline {
    agent any

    tools {
        nodejs "node"
    }

    stages {
        stage('Install') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[credentialsId: '', 
                    url: 'https://github.com/Niiqow/test2.git']]
                ])
                sh 'npm install'
            }
        }
    }
}


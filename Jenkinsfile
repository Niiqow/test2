pipeline {
    agent any
    environment {
        DOCKER_HOME = "/usr/local/bin/docker"
    }

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
   

    stage('build') {
      steps {
      
          script {
            try {
              sh 'docker stop ${container_name}'
              sh 'docker rm ${container_name}'
              sh 'docker rmi ${image_name}:${tag_image}'
            } catch (Exception e) {
              echo 'Exception occurred: ' + e.toString()
            }
          }
          sh 'npm run build'
          sh 'docker build -t ${image_name}:${tag_image} .'
        
      }
    }

    stage('deploy') {
      steps {
        sh 'docker run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}'
      }
    }
     }
  }



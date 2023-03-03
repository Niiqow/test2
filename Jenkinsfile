pipeline {
  agent any
  
  parameters {
    string(name: 'container_name', defaultValue: 'test2', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'test2', description: 'Nombre de la imagen docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '90', description: 'Puerto que usa el contenedor')
  }
  
  environment {
    DOCKERHUB_CREDENTIALS = credentials('task')
    DOCKERHUB_IMAGE = 'niiqow/task'
  }
  
  stages {
    stage('install') {
      steps {
        git(branch: 'develop', url: 'https://github.com/Niiqow/test2.git')
      }
    }

    stage('build') {
      steps {       
        sh "docker build -t ${image_name}:${tag_image} --file Dockerfile ."
      }
    }
    
    stage('Login to DockerHUB') {
      steps {
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password dckr_pat_ReBPx0jgG6Dia-ZKMhab9fpcif4'
      }
    }

    stage('Push to DockerHUB') {
      steps {
        sh "docker tag ${image_name}:${tag_image} ${DOCKERHUB_IMAGE}:${tag_image}"
        sh "docker push ${DOCKERHUB_IMAGE}:${tag_image}"
      }
    }
    
   stage('Deploy to Azure App Service') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('Azure-Service-Principal')]) {
          sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
          sh 'export PATH=$PATH:/usr/local/bin'
          sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'
          sh "az webapp create -g SOCIUSRGLAB-RG-MODELODEVOPS-DEV -p Plan-SociusRGLABRGModeloDevOpsDockerDev -n sociuswebapptest008 -i ${DOCKERHUB_IMAGE}:${tag_image}"
        }

      }
    }

    
    
  }
}

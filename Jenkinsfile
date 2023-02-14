pipeline {
  agent any
  
  environment {
    PATH = "${env.PATH}:/Users/niiqow/.nvm/versions/node/v18.12.1/bin"
  }
  
  parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pagina_img', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
  
  stages {
    stage('install') {
      steps {
        git branch: 'main', url: 'https://github.com/Niiqow/test2.git'
       
          sh 'npm install'
        
      }
    }


    stage('build') {
      steps {
        sh 'export PATH=$PATH:/Users/niiqow/.nvm/versions/node/v18.12.1/bin'
        sh 'npm run build'
        sh "/usr/local/bin/docker build -t ${image_name}:${tag_image} --file dockerfile ."
      
      }
    }
//aa
    stage('deploy') {
      steps {
         sh "/usr/local/bin/docker rm -f ${container_name}" // Elimina el contenedor si existe
        sh "/usr/local/bin/docker run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}"
         
      }
    }
  }
}


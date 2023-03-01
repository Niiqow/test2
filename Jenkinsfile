pipeline {
  agent any
  
  parameters {
    string(name: 'container_name', defaultValue: 'test2', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'test2', description: 'Nombre de la imagen docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '90', description: 'Puerto que usa el contenedor')
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

    stage('deploy') {
      steps {     
        sh "docker rm -f ${container_name}" || true // Elimina el contenedor si existe o continúa si no existe
        sh "docker create --name ${container_name} -p ${container_port}:90 ${image_name}:${tag_image}" // Crea el contenedor   
        sh "docker run -d -p ${container_port}:90 --name ${container_name} ${image_name}:${tag_image}"
      }
    }
  }
}



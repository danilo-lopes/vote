pipeline {

  environment {
    registry = "dansolo7/voting"
    registryCredential = credentials('dockerhub_credential')
    
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/danilo-lopes/vote'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dansolo7/voting + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          echo registryCredential
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push()
            dockerImage.push('latest')
          }
        }
      }
    }

  }
}
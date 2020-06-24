pipeline {

  environment {
    registry = "dansolo7/voting"
    
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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          echo registryCredential
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credential') {
            dockerImage.push()
            dockerImage.push('latest')
          }
        }
      }
    }

  }
}
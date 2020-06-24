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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          echo registryCredential
          docker.withRegistry('https://hub.docker.com/', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "vote-k8s.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
pipeline {
    agent any
    stages {
         stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build1') {
      steps {
        sh 'sudo docker build -t todo .'
      }
    } 
  }       
 }
    

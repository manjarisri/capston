pipeline {
    agent any
    stages {
      stage('Checkout') {
         steps {
           checkout scm
         }
      }
      stage('Buil') {
         steps {
           sh 'docker build -t todo .'
         }
      } 
    }       
 }
    

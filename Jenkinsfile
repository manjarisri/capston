pipeline {
    agent any
    environment {     
        DOCKERHUB_CREDENTIALS= credentials(dockrehubid: 'manjarisri', password: 'Manjari04')     
    } 
    stages {
      stage('Checkout') {
         steps {
           checkout scm
         }
      }
      stage('Building stage') {
         steps {
           sh 'docker build -t manjarisri/todo:$BUILD_NUMBER .'
         }
      } 
      stage('test stage') {
         steps {
           echo 'this is testing stage'
         }
      }   
      stage('Archive Artifacts') {
         steps {
           archiveArtifacts artifacts: 'requirements.txt', onlyIfSuccessful: true
         }
      }  
      stage('Pushnig image to dockerhub') {         
         steps{   
            sh 'docker login -u manjarisri -p ${Manjari04}' 
            sh 'docker push manjarisri/todo:$BUILD_NUMBER'       
         }            
      } 
        
        

    }       
 }
    

pipeline {
    agent any
    environment {
      usr = 'manjarisri'
      pass = 'Manjari04'
    }
    stages {
       stage("Git Checkout"){           
         steps{                
	       git branch: 'development', url: 'https://github.com/manjarisri/capston'                 
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
            withCredentials([usernamePassword(credentialsId: 'dockerhubcred', passwordVariable: 'pass', usernameVariable: 'usr')]){
            sh 'docker login -u $usr -p $pass' 
            sh 'docker push manjarisri/todo:$BUILD_NUMBER'       
         }            
	 } 
      }
        
        

    }       
 }
    

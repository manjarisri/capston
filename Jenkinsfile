pipeline {
    agent any
    environment {
      usr = 'manjarisri'
      pass = 'Manjari04'
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
      stage('deploy to k8s'){
	      steps{
	        withCredentials([file(credentialsId: 'minikubeconf', variable: 'ms')]) {
	           sh 'kubectl --kubeconfig=$ms apply -f dep.yaml'
                   sh 'kubectl --kubeconfig=$ms set image deployment/my-dep dep-con=manjarisri/todo:$BUILD_NUMBER'
                 }  
              }       
       }
    
    }
}

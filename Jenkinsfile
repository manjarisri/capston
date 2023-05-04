pipeline {
    agent any
    stages {
       stage('Run Tests') {
          steps {
             sh 'python -m unittest discover tests'
          }
       }
       stage('Build') {
          steps {
             sh 'python setup.py sdist'
          }
       }
       stage('Deploy to Production') {
          environment {
            APP_NAME = 'my-python-app'
            SERVER_IP = '123.45.67.89'
            SSH_USER = 'user'
            SSH_KEY = credentials('my-ssh-key')
          }
          steps {
           sshagent(['my-ssh-key']) {
             sh '''
               scp dist/my_python_app-*.tar.gz $SSH_USER@$SERVER_IP:/tmp
               ssh $SSH_USER@$SERVER_IP "sudo pip install /tmp/my_python_app-*.tar.gz && sudo systemctl restart $APP_NAME"
          '''
        }
      }
  }

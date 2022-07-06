pipeline {
    agent any
    environment {
        registry = "136954245697.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment"
    }

    stages {
        stage('Cloning Git') {
            steps {
                git branch: 'main', url: 'https://github.com/AnjaliRekhate/upGrad-Course_Project.git'
            }
        }

    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }

    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
        steps{
            script {
                sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 136954245697.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment'
                sh 'docker push 136954245697.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment'
            }
        }
    }

    stage('Docker Run') {
     steps{
         script {
             sshagent(credentials : ['aws_ec2']){

                sh 'ssh -o StrictHostKeyChecking=no -i demo.pem ubuntu@10.0.2.102'

             }
                //sh 'ssh -i /login/demo.pem ubuntu@10.0.2.102'
                sh 'docker run -d -p 8081:8080 --rm --name node 136954245697.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment'
            }
      }
    }
    }
}

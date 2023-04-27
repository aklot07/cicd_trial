pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/aklot07/cicd_trial.git']]])            

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("terraform Apply") {
            steps {
                sh ('terraform apply --auto-approve') 
           }
        }
        stage('Deploying Application to AKS') {
            steps {
                withKubeConfig([credentialsId: 'k8s-pool', serverUrl: 'https://akdnsprefix-1e9qxh74.hcp.eastasia.azmk8s.io']){
                sh 'kubectl apply -f deployment.yaml'
                }
      }
    }
    }
}

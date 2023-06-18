pipeline {
  agent any

  environment {
    dockerImage = ''
    registry = 'ngwaabanjong/abc-app1'
    registryCredential = 'hub-key'
  }
  tools {
    maven 'maven'
  }
  stages {
    stage('Build Maven') {
      steps {
        checkout scmGit(branches: [
          [name: '*/main']
        ], extensions: [], userRemoteConfigs: [
          [credentialsId: 'git-classic-token', url: 'https://github.com/Ngwaabanjong/final-grade-prj2.git']
        ])
        sh 'mvn clean install'
      }
    }


    stage('Build Docker image with Ansible') {
      steps {
        script {  
          sh "ansible-playbook ansible1.yml"
        }
      }
    }

    // stage('Push image to Hub') {
    //   steps {
    //     script {
    //       docker.withRegistry('', registryCredential) {
    //         sh 'docker push ngwaabanjong/xyz-app'
    //       }
    //     }
    //   }
    // }

    stage('Deploy to Kubernetes with Ansible') {
      steps {
        script {  
          sh "ansible-playbook ansible2.yml"
        }
      }
    }
  }
}
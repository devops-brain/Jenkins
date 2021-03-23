pipeline {
  agent {
    label "saltmaster"
  }

  stages {
    stage('add helm repo and init'){
      steps {
        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh "helm repo add jenkins https://charts.jenkins.io"
        sh "helm repo update"
      }
    }
    stage('upgrade or install jenkins'){
      steps {
        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh "#helm upgrade -i -n jenkins --create-namespace --atomic -f values.yaml jenkins jenkins/jenkins"
        sh "helm upgrade -i -n jenkins --create-namespace -f values.yaml jenkins jenkins/jenkins"
      }
    }
  }
}
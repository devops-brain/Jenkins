pipeline {
  agent {
    label "kubectl"
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
        sh "#microk8s helm3 upgrade -i -n jenkins --create-namespace --atomic -f values.yaml jenkins jenkins/jenkins"
        sh "microk8s helm3 upgrade -i -n jenkins --create-namespace -f values.yaml jenkins jenkins/jenkins"
      }
    }
  }
}
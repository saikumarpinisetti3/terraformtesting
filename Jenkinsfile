pipeline {
  agent any

  parameters {
    choice(name: 'action', choices: 'create\ndestroy', description: 'Create/Destroy the infrastructure')
  }

  environment {
    ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
    SECRET_KEY = credentials('AWS_SECRET_KEY_ID')
  }

  stages {
    stage('git checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/saikumarpinisetti3/terraformtesting.git'
      }
    }

    stage('terraform init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
           sh 'terraform plan --var-file=./config/dev.tfvars'  
}
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply --var-file=./config/dev.tfvars --auto-approve'
      }
    }

    stage('Terraform Destroy') {
      steps {
        sh 'terraform destroy --var-file=./config/dev.tfvars --auto-approve'
      }
    }
  }
}

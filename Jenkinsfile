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

    stage('Configure AWS CLI') {
      steps {
        sh 'aws configure set aws_access_key_id '
        sh 'aws configure set aws_secret_access_key '
        sh 'aws configure set region ap-south-1'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan --var-file=./config/dev.tfvars'
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

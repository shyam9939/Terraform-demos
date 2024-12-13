pipeline {
    agent any
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
    }
    parameters {
        booleanParam(name: 'RUN_TERRAFORM_INIT', defaultValue:true, description:'Run Terraform init')
        booleanParam(name: 'RUN_TERRAFORM_VALIDATE', defaultValue:true, description:'Run Terraform validate')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'gcp-terraform',
                url: 'https://github.com/shyam9939/Terraform-demos.git'
            }
        }
        stage('Terraform Init') {
            when {
                expression { return params.RUN_TERRAFORM_INIT
                }
            }
            steps {
                sh '''
                    which terraform
                    terraform version
                    terraform init \
                    -backend-config="bucket=bucket-for-tfstate-file" \
                    -backend-config="prefix=terraform1/state"
                '''
            }
        }
        stage('Terraform Validate') {
            when {
                expression { return params.RUN_TERRAFORM_VALIDATE
                }
            }
            steps {
                sh 'terraform validate'
                sh 'terraform apply -auto-approve'
            }
        }
    }
  
}

pipeline {
    agent any
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
    }
    parameters {
        booleanParam(name: 'RUN_TERRAFORM_INIT', defaultValue: false, description: 'Run Terraform init')
        booleanParam(name: 'RUN_TERRAFORM_VALIDATE', defaultValue: false, description: 'Run Terraform validate')
        booleanParam(name: 'RUN_TERRAFORM_PLAN', defaultValue: false, description: 'Run Terraform plan')
        booleanParam(name: 'RUN_TERRAFORM_APPLY', defaultValue: false, description: 'Run Terraform apply')
        booleanParam(name: 'RUN_TERRAFORM_DESTROY', defaultValue: false, description: 'Run Terraform destroy')
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
                expression { params.RUN_TERRAFORM_INIT }
            }
            steps {
                sh '''
                    terraform init \
                    -backend-config="bucket=bucket-for-tfstate-file" \
                    -backend-config="prefix=terraform1/state" \
                    -force-copy
                '''
            }
        }
        stage('Terraform Validate') {
            when {
                expression { params.RUN_TERRAFORM_VALIDATE }
            }
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            when {
                expression { params.RUN_TERRAFORM_PLAN }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                expression { params.RUN_TERRAFORM_APPLY }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { params.RUN_TERRAFORM_DESTROY }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

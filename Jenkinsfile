pipeline {
    agent any
    tools {
    terraform 'terraform' // Matches the name in Global Tool Configuration
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
        PATH = "${env.PATH}:/var/lib/jenkins/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/terraform"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'gcp-terraform',
                url: 'https://github.com/shyam9939/Terraform-demos.git'
            }
        }
        stage('Terraform Init') {
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
            steps {
                sh 'terraform validate'
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        success {
            echo 'Pipeline succeeded!'
            mail to: 'shyamkumar84895@gmail.com',
                subject: "Pipeline Succeeded: ${currentBuild.fullDisplayName}",
                body: "The pipeline ${env.BUILD_URL} has successfully completed."
        }
        failure {
            echo 'Pipeline failed!'
            mail to: 'shyamkumar84895@gmail.com',
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: "The pipeline ${env.BUILD_URL} has failed. Check the logs for details."
        }
    }
}

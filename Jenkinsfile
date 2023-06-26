@Library('jenkins-shared-lib') _



//with --- use it if watn to create / 
pipeline {
    agent any
    parameters {
        string(name:'aws_region', description: "Name of AWS region", defaultValue: "us-east-1")
        string(name:'private_repo_name', description: "private_repo_name", defaultValue: "val")
        string(name:'project_name', description: "project_name", defaultValue: "java-app")
    }

    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRECT_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')

    }

    stages {
        stage('Git Checkout') {
            steps {
                gitCheckout(branch: "main", url: "https://github.com/yogeshcd/java-app.git")
                // git branch: 'main', url: 'https://github.com/yogeshcd/project1-java-app-demo.git'
            }
        }
        // stage('Unit Test maven') {
        //     steps {
        //         mvnTest()
        //     }
        // }
        // stage('Integration Test maven') {
        //     steps {
        //         mvnIntegrationTest()
        //     }
        // }
        // stage('Sonar Code analysis: SonarQube') {
        //     steps {
                
        //         script {
        //             sonarCodeAnalysis('sonar-api-cred')
        //         }
        //     }
        // }
                        
        // stage('Sonar Quality gate: SonarQube') {
        //     steps {
        //         script {
        //         sonarQualityGate('sonar-api-cred')
        //         }
        //     }
        // }

        // stage('Maven build: Maven') {
        //     steps {
        //         script {
        //         mvnBuild()
        //         }
        //     }
        // }
        // stage('Docker Build') {
        //     steps {
        //         script {
        //         dockerBuild(private_repo_name: params.private_repo_name, project_name: params.project_name,region: params.aws_region )
        //         }
        //     }
        // }
        // stage('Docker Scan: Trivy ') {
        //     steps {
        //         script {
        //         dockerImageScan(private_repo_name: params.private_repo_name, project_name: params.project_name,region: params.aws_region )
        //         }
        //     }
        // }
        // stage('Docker Push') {
        //     steps {
        //         script {
        //         dockerPushECR(private_repo_name: params.private_repo_name, project_name: params.project_name, region: params.aws_region )
        //         }
        //     }
        // }
        // stage('Docker Clean up') {
        //     steps {
        //         script {
        //         dockerCleanUP(private_repo_name: params.private_repo_name, project_name: params.project_name, region: params.aws_region )
        //         }
        //     }
        // }
        stage("Terraform") {
            steps {
                script{
                    dir('terraform-eks') {
                        sh """
                        pwd
                        ls -l
                        """
                        def access_key = "key"
                        def secret_key = "key"
                        terraformApply(access_key=access_key, secret_key=secret_key)
                    }
                }
            }
        }
    }
}
@Library('jenkins-shared-lib') _

pipeline {
    agent any
    parameters {
        string(name:'aws_region', description: "Name of AWS region", defaultValue: "us-east-1")
        string(name:'private_repo_name', description: "private_repo_name", defaultValue: "val")
        string(name:'project_name', description: "project_name", defaultValue: "java-app")
    }
    stages {
        stage('Git Checkout') {
            steps {
                gitCheckout(branch: "main", url: "https://github.com/yogeshcd/project1-java-app-demo.git")
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
        stage('Docker Build') {
            steps {
                script {
                dockerBuild(private_repo_name: ${params.private_repo_name}, project_name: ${params.project_name},region: ${params.region} )
                }
            }
        }
    }
}
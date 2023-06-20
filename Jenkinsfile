@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                gitCheckout(branch: "main", url: "https://github.com/yogeshcd/project1-java-app-demo.git")
                // git branch: 'main', url: 'https://github.com/yogeshcd/project1-java-app-demo.git'
            }
        }
        stage('Unit Test maven') {
            steps {
                mvnTest()
            }
        }
        stage('Integration Test maven') {
            steps {
                mvnIntegrationTest()
            }
        }
        stage('Sonar Code analysis: SonarQube') {
            steps {
                
                script {
                    sonarCodeAnalysis(credentialsId: 'sonar-api-cred')
                }
            }
        }
                        
        stage('Sonar Quality gate: SonarQube') {
            steps {
                script {
                sonarQualityGate(credentialsId: 'sonar-api-cred')
                }
            }
        }
    }
}
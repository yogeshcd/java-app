@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                
                git branch: 'main', url: 'https://github.com/yogeshcd/project1-java-app-demo.git'
            }
        }
    }
}
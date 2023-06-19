@Library('jenkins-shared-lib') _

pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                gitCheckout(branch: "main", url: "https://github.com/yogeshcd/project1-java-app-demo.git")
                // git branch: 'main', url: 'https://github.com/yogeshcd/project1-java-app-demo.git'
            }
        }
    }
}
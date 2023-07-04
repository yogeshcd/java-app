@Library('jenkins-shared-lib') _



//with --- use it if watn to create / 
pipeline {
    agent any
    parameters {
        string(name:'aws_region', description: "Name of AWS region", defaultValue: "us-east-1")
        string(name:'private_repo_name', description: "private_repo_name", defaultValue: "val")
        string(name:'project_name', description: "project_name", defaultValue: "java-app")
        string(name:'helm_chart_name', description: "helm_chart_name", defaultValue: "helm-java-app")
        string(name:'release_name', description: "release_name", defaultValue: "java-app")
    }

    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRECT_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        // HELM_CHART_VERSION = "${sh(helm inspect chart helm-java-app  | grep version | awk '{print $2}')}"
        HELM_CHART_VERSION = "${sh(returnStdout: true, script: "helm inspect chart helm-java-app  | grep version: | awk '{print \$2}'").trim()}"
        FILE=".tgz"
        NAME="$HELM_CHART_VERSION$FILE"
        // HELM_CHART_VERSION=$(helm inspect chart helm-java-app  | grep version: | awk '{print $2}')
    }

// environment {
//         GO114MODULE = 'on'
//         CGO_ENABLED = 0
//         GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
//         GCP_SECRET_FILE = credentials('gcp-account-json')
        // TAG = "${sh(returnStdout: true, script: 'git rev-parse --short=7 HEAD').trim()}"
//     }

// sh '''
//                             VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
//                             OS=Linux
//                             ARCH=x86_64
//                             curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" > go-containerregistry.tar.gz
//                             tar -zxvf go-containerregistry.tar.gz -C /usr/local/bin/ crane
//                             crane version
//                           '''
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
        // stage("Terraform") {
        //     steps {
        //         script{
        //             dir('terraform-eks') {
        //                 sh """
        //                 pwd
        //                 ls -l
        //                 """
        //                 // def access_key = $AWS_ACCESS_KEY
        //                 // def secret_key = $AWS_SECRECT_ACCESS_KEY
        //                 terraformApply()
        //             }
        //         }
        //     }
        // }
        stage("Connect to k8s") {
            steps {
                script{
                    def cluster_name = "demo"
                    connectK8SCluster(region: params.aws_region,cluster: cluster_name )
                }
            }
        }
        stage("Helm push") {
            steps {
                script{
                    // helmPush(helm_chart_name: params.helm_chart_name, region: params.aws_region)
                    sh "echo helm push"
                    sh '''
                    echo $TAG
                    
                    '''
                    helmChartPush(helm_chart_name: params.helm_chart_name,region: params.aws_region )
                }
            }
        }
        stage("Helm deploy") {
            steps {
                script{
                    helmDeploy(helm_chart_name: params.helm_chart_name, region: params.aws_region, release_name: params.release_name)
                }
            }
        }
    }
}
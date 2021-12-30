pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
        }
    }

    environment {
        registry = "dineshelango/copyfiles"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    stages {
        stage('docker-build') {
            steps {
                dir('build') {
                    container('docker') {
                        script {
                            dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        }
                    }
                }
            }
        }

        stage('docker-push') {
            steps {
                container('docker') {
                    script {
                        docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}
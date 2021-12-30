pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
        }
    }

    environment {
        registry = 'dineshelango/copyfiles'
        registryCredential = 'dockercred'
    }

    stages {
        stage('docker-build') {
            steps {
                dir(build) {
                    script {
                        container('docker') {
                            docker.build("copyfiles:${env.BUILD_ID}")
                        }
                    }
                }
            }
        }

        stage('docker-push') {
            steps {
                script {
                    container('docker') {
                        docker.withRegistry( '', registryCredential ) {
                            docker.Image.push()
                        }
                    }
                }
            }
        }
    }
}
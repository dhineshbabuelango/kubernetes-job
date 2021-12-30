pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
        }
    }

    environment {
        registry= "dineshelango/copyfiles"
        registryCredential= 'dockercred'
        dockerImage = ''
    }

    stages {
        stage(dockerbuild) {
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
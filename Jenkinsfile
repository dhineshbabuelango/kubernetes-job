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
                            dockerImage = docker.build("copyfiles:${env.BUILD_ID}")
                            docker.withRegistry( '', 'registryCredential' ) {
                                dockerImage.push()
                            }
                        }
                    }
                }
            }
        }
    }
}
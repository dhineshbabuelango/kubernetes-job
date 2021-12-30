pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
            defaultContainer 'docker'
        }
    }

    environment {
        registry = 'dineshelango/copyfiles'
        registryCredential = 'dockercred'
    }

    stages {
        stage('hostname') {
            steps {
                container('docker') {
                    sh 'hostname'
                }
            }
        }
        stage('dockerbuild') {
            steps {
                dir('build') {
                    script {
                        container('docker') {
                             dockerImage = docker.build("copyfiles:${env.BUILD_ID}")
                        }
                    }
                }
            }
        }
        stage('docker-push') {
            steps {
                script {
                    container('docker') {
                        docker.withRegistry( '', 'registryCredential' ) {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}

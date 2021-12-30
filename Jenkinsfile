pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
        }
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
                            dockerImage = docker.build copyfiles:v5
                        }
                    }
                }
            }
        }
    }
}
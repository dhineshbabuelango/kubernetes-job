pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
            defaultContainer 'docker'
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
                            docker.build copyfile:v5
                        }
                    }
                }
            }
        }
    }
}
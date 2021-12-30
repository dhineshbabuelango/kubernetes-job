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
                    container('docker') {
                        sh 'docker build -t copyfiles:v5 .'
                    }
                }
            }
        }
    }
}
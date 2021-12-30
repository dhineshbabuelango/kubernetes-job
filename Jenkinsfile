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
                        container('jnlp') {
                             docker.build("copyfiles:${env.BUILD_ID}")
                        }
                    }
                }
            }
        }
    }
}
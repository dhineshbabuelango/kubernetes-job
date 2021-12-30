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
    }
}
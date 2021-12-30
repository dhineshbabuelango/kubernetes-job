pipeline {
    agent {
        kuberbetes {
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
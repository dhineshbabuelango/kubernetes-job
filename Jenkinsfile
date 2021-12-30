pipeline {
    agnet {
        kuberbetes {
            yamlFile 'job.yaml'
        }
    }

    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockercred')
    }

    stage {
        stage('docker-build') {
            steps {
                dir("${workspace}/build")
                container('docker') {
                    dockerImage = docker.build copyfiles
                }

            }
        }
    }
}
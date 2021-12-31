pipeline {
    agent {
        kubernetes {
            yamlFile 'job.yaml'
        }
    }

    environment {
        registry = "dineshelango/copyfiles"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    stages {
        stage('docker-build') {
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

        stage('update-build') {
            steps {
                dir('deployment') {
                    sh 'cat file.yaml |sed "s#dineshelango/copyfiles:v2#dineshelango/copyfiles:${BUILD_NUMBER}#g" > copyfiles-${BUILD_NUMBER}.yaml'
                }
            }
        }

        stage('deploy') {
            steps {
                dir('deployment') {
                    container('jnlp') {
                        kubernetesDeploy(configs: "copyfiles-${BUILD_NUMBER}.yaml", kubeconfigId: "kubeconfig-global")
                    }
                }
            }
        }

    }
}
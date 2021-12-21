pipeline {
    environment {
        registry = "dhineshelango/copyfiles"
        registryCredential = "dockerrepo"
        dockerImage = ''
    }
    agent any
    stages {
        stage('pulling the repo')
        steps {
            git 'https://github.com/dhineshbabuelango/kubernetes-job.git'
        }
    }

}
pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerrepo')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker build -t copyfiles:v1 build'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
                sh 'sudo docker tag copyfiles:v1 dineshelango/copyfiles:v1'
				sh 'sudo docker push dineshelango/copyfiles:v1'
			}
		}

        stage('deploy-eks') {
            steps {
                sh "kubectl apply -f deployment/file.yaml"
            }
        }
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
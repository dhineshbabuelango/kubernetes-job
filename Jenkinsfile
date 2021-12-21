pipeline{

	agent  { docker { image 'centos:latest' } }

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
				sh 'sudo docker push copyfiles:v1'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
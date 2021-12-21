pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerrepo')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t copyfiles:latest build'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push scriptcopyfles:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
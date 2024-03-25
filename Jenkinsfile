pipeline {
    agent {
		docker {
            image 'maven:3.9.0'
            args '-v /root/.m2:/root/.m2'
        }
	}
	stages {
	    stage('Clone') {
		    steps {
			   git branch: 'main', url: 'https://github.com/TranQuangPhong/jenkins.git'
			}
		}
		stage('Build') {
			steps {
				echo 'mvn build jar file'
				sh 'mvn -B -DskipTests clean package' 
			}
		}
		stage('Push docker image') {
			steps {
				withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
					sh 'docker build -t randomdog/jenkins:v1 .'
					sh 'docker push -t randomdog/jenkins:v1'
				}
			}
		}
	}
}

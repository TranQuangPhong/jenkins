pipeline {
    agent any
	tools {
        maven 'maven'
        jdk 'jdk'
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
				withDockerRegistry(credentialsId: 'docker-hub-with-access-token', url: 'https://index.docker.io/v1/') {
					echo 'docker login'
					sh 'docker login -u randomdog'
					echo 'docker build'
					sh 'docker build -t randomdog/jenkins:v1 .'
					echo 'docker push'
					sh 'docker push -t randomdog/jenkins:v1'
				}
			}
		}
	}
}

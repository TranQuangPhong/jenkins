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
				withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
					sh 'docker build -t randomdog/jenkins:v1 .'
					sh 'docker push -t randomdog/jenkins:v1'
				}
			}
		}
	}
}

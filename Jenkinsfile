pipeline {
    agent any
    triggers {
        pollSCM('* * * * *') 
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn package dockerfile:build'
                sh 'mvn dockerfile:push'
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8081:8081 localhost:5000/spring-boot-app:1.3.5.RELEASE'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest'
            }
        }
    }
}
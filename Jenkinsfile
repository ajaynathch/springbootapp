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
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8081:8081 localhost:5000/spring-boot-app:1.3.5.RELEASE'
            }
        }
    }
}
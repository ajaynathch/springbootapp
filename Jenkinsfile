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
    }
}
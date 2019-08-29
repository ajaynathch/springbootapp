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
        stage('Stage') {
            steps {

                sh 'docker run -d -p 8081:8081 localhost:5000/spring-boot-app:1.3.5.RELEASE'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stack rm getstartedlab'
                sh 'docker swarm leave --force'
                sh 'docker swarm init'
                sh 'docker stack deploy -c docker-compose.yml getstartedlab'
            }
        }
    }
}
pipeline {
    agent any

    stages {
        stage('checkout code') {
            steps{
                git url:"https://github.com/PwtanSG/cicd-react-app.git",branch:"master"
            }
        }
        stage('install dependencies') {
            steps{
                sh "npm install"
            }
        }
        stage('node build') {
            steps{
                sh "npm run build"
            }
        }
    }
}

pipeline {
    agent any
    environment {
        APP_DIR = '/app'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/appleisthebestfruit/reactvitetest2.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Running build commands
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Check permissions and ownership
                    sh "ls -ld /app"
                    sh "id"

                    // Copy build to shared volume
                    sh "cp -r dist/* ${APP_DIR}"
                }
            }
        }

    }
}

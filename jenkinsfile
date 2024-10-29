pipeline {
    agent any
    tools {
      nodejs 'nodejs'
    }
    stages {
            stage('Checkout') {
                steps {
                    git branch: 'main', credentialsId: '607bc2c7-089e-423a-88ad-7b97cf3f9574' ,url: 'https://github.com/TaxDev101/recouvrement.git' , timeout: 30 * 60
                }
            }   
    
            stage('Build') {
                steps {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
            stage('Test') {
                steps {
                    sh 'npm test' // Tests unitaires
                    sh 'npm run test:integration' // Tests d'intégration
                    sh 'npm run test:e2e' // Tests end-to-end
                }
            }
            stage('Deploy') {
                steps {
                    sh 'docker build -t recouvrement-app . '
                    sh 'docker push recouvrement-app' // Pousser l'image dans un registre Docker
                    sh 'docker stop recouvrement-app || true'
                    sh 'docker rm recouvrement-app || true'
                    sh 'docker run -d -p 80:3000 recouvrement-app:latest'
                }
            }
    }
}

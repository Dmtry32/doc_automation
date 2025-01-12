pipeline {
    agent { label 'linux' }
    stages {
        stage('Get Hostname') {
            steps {
                script {
                    // Fetch and display the hostname
                    def hostname = sh(script: 'hostname', returnStdout: true).trim()
                    echo "Hostname: ${hostname}"
                }
            }
        }
    }
}

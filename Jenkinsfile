pipeline {
    agent any
    stages {
        stage("Clean workspace") {
            steps {
                sh "git clean -xdf"
            }
        }
        stage("Build and push docker image") {
            when {
                branch 'main'
            }
            steps {
                script {
                    docker.withRegistry('https://releases.docker.buddaphest.se', 'nexus') {

                        def customImage = docker.build("marwinfaiter/pyplanet:${env.BUILD_ID}", "--target standard .")

                        customImage.push()
                        customImage.push("latest")
                    }
                }
                script {
                    docker.withRegistry('https://releases.docker.buddaphest.se', 'nexus') {

                        def customImage = docker.build("marwinfaiter/pyplanet:rmt-${env.BUILD_ID}", "--target rmt .")

                        customImage.push()
                        customImage.push("rmt")
                    }
                }
            }
        }
    }
    post {
        always {
            sh "docker system prune -af"
        }
    }
}

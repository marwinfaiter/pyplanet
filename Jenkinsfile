pipeline {
    agent any
    stages {
        stage("Build and push docker image") {
            when {
                branch 'main'
            }
            steps {
                script {
                    docker.withRegistry('https://releases.docker.buddaphest.se', 'nexus') {

                        def customImage = docker.build("marwinfaiter/pyplanet:${env.BUILD_ID}")

                        customImage.push()
                        customImage.push("latest")
                    }
                }
            }
        }
    }
}

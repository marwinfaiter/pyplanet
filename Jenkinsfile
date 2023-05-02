pipeline {
    agent any
    stages {
        stage("Run tests in docker") {
            agent {
                dockerfile true
            }
            stages {
                stage("Install dependencies") {
                    sh "pip install mypy pytest"
                }
                stage("Run tests") {
                    steps {
                        sh "mypy ."
                        sh "pytest ."
                    }
                }
            }
        }
    }
}

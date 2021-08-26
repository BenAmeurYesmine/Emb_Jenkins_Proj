pipeline {
    agent any

    stages {
        stage('Debuging') {
            steps {
                 dir('..\\TOOLS') {
                    sh'python compile.py Debug'
                 }
                 echo 'compilation done'
                 emailext attachLog: true, body: '', subject: 'build', to: 'mina.benameur@gmail.com'


                }
            }
        
        stage('Flashing') {
            steps {
               dir('..\\TOOLS') {
                    sh' ./flash_target.sh '
                }
                echo 'Flashing done'
            }
        }
        stage('Bringup') {
            steps {
               dir('..\\TOOLS') {
                    sh' ./bringup2.sh '
                }
                echo 'Bringup done'
            }
        }

    }
}
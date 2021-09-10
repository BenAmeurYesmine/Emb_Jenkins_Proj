pipeline {
    agent any

 
        stage('Debuging') {
            steps {
                 dir('.\\TOOLS') {
                    sh'python compile.py'
                 }
                 echo 'compilation done'
               
				 emailext attachLog: true, body: '', subject: '', to: 'bameuryasmine@gmail.com'


                }
            }
			
		stage('Doxygene') {
            steps {
                 dir('.\\TOOLS') {
                    sh'./Doxygen.sh'
                 }
                 echo 'doxygen files generated'
                 publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'TOOLS\\Doxygen\\html', reportFiles: '*.html', reportName: 'HTML Report', reportTitles: ''])
                }
            }
        
    	   stages {
	    stage('Flashing') {
            steps {
               dir('.\\TOOLS') {
                    sh' ./flash_target.sh '
                }
                echo 'Flashing done'
            }
        }
		
        stage('Bringup') {
            steps {
               dir('.\\TOOLS') {
                    sh' ./bringup2.sh '
                }
                echo 'Bringup done'
            }
        }
		
		

    }
}

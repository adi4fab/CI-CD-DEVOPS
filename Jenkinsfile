pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
    }

    stages {
        // Specify various stage with in stages

        // stage 1. Build
        stage ('Build'){
            steps {
                sh 'mvn clean install package'
            }
        }

        // Stage2 : Testing
        stage ('Test'){
            steps {
                echo ' testing......'

            }
        }

        // Stage3 : Publish the source code to Sonarqube
        stage ('Publish to NEXUS'){
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'devops', classifier: '', file: 'target/devops-0.0.8-SNAPSHOT.war', type: 'war']], credentialsId: 'nexus', groupId: 'com.aditya', nexusUrl: '172.20.10.237:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'CI-CD-SNAPSHOT', version: '0.0.8.SNAPSHOT'
                
            }
            
        }

        
        
    }

}
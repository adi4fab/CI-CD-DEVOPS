pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
    }

    environment{
       ArtifactId = readMavenPom().getArtifactId()
       Version = readMavenPom().getVersion()
       Name = readMavenPom().getName()
       GroupId = readMavenPom().getGroupId()
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

        // Stage 4 : Print some information
        stage ('Print Environment variables'){
                    steps {
                        echo "Artifact ID is '${ArtifactId}'"
                        echo "Version is '${Version}'"
                        echo "GroupID is '${GroupId}'"
                        echo "Name is '${Name}'"
                    }
                }

        // Stage3 : Publish the source code to Sonarqube
        stage ('Publish to NEXUS'){
            steps {
                nexusArtifactUploader artifacts: [
                [artifactId: "${ArtifactId}", 
                classifier: '', 
                file: 'target/devops-0.0.3-SNAPSHOT.war', 
                type: 'war']], 
                credentialsId: 'nexus', 
                groupId: "${GroupId}", 
                nexusUrl: '172.20.10.237:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'CI-CD-SNAPSHOT', 
                version: "${Version}"
                
            }
            
        }

        
        
    }

}
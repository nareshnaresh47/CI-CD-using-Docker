pipeline {
    agent any
	tools {nodejs "node"
    stages {
        stage('Tests') {
            steps {
//                 script {
//                    docker.image('node:10-stretch').inside { c ->
                        echo 'Building..'
                        sh 'npm install'
                        echo 'Testing..'
                        sh 'npm test'
//                         sh "docker logs ${c.id}"
//                    }
//                 }
            }
        }
        stage('Build and push docker image') {
            steps {
                script {

                  
                    sh 'docker build -t nodedemo .' 
					 sh 'docker run -d --name node-demo -p 8081:3000 nodedemo'
			sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8002:80 nikhilnidhi/samplewebapp"
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
                    }
                }
            }
        }

    }

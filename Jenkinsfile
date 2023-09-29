pipeline{
    agent any
    
    stages{
        stage("clone code"){
            steps{
                echo "cloning the code"
                git url:"https://github.com/harshalbhoyar/bharat_energy.git",branch: "master"
            }
        }
        
        stage("build") {
            steps {
                //echo "Cleaning up images and containers"
                //sh 'docker-compose down -v ; docker rm -vf $(docker ps -aq) ; docker rmi -f $(docker images -aq)'
                echo "Building the code"
                sh "rm -rf Dockerfile"
                dir('bharat_energy_app') {
                    sh 'docker build -t bharat_energy .'
                }
            }
        }
        
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to Docker Hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag bharat_energy ${env.dockerHubUser}/bharat_energy:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/bharat_energy:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
   
 }
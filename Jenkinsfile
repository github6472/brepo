pipeline{
    agent any 
    stages {
         stage( 'code pull') {
            steps {
                git branch :'master' ,url:'https://github.com/github6472/crepo.git'
                echo 'git pull successesful'
            }
        }
        stage ('code build') {
            steps {
                sh 'mvn install'
            }
        }
        stage ('script billd') {
            steps {
                sh ' i=1
while [ ("$i" -lt "$1") ]
do
   echo "============== creating container $i =============="
   docker run -itd --name ${cool_}${1} --hostname ${cool_${1}} -v /home/workspace/dev-data:/home/workspace/docker_data -p 806${1}:8080 shaikghouse/myubuntu /bin/bash
   echo "$(docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' ${cool_}${1})"
   docker cp /target/crepo.war  ${cool_}${1}:/home/dev_data/apache-tomcat-9.0.55/webapps
   docker exec -itd ${cool_}${1} /home/dev_data/apache-tomcat-9.0.55/bin/startup.sh
   i=$(($i+1))

done '
            }
        }
    }
}

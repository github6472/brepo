#!/bin/bash -xe


i=1
while [ "$i" -lt "$1" ]
do
   echo "============== creating container $i =============="
   docker run -itd --name cool_$i --hostname cool_$i -v /home/workspace/dev-data:/home/workspace/docker_data -p 807$i:8080 shaikghouse/myubuntu /bin/bash
   echo "$(docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' cool_$i)"
   docker cp /home/workspace/.jenkins/workspace/trail_docker/target/crepo.war  cool_$i:/home/dev_data/apache-tomcat-9.0.55/webapps
     
   i=$(($i+1))

done


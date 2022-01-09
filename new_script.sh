#!/bin/bash -xe


i=1
while [ "$i" -lt "$1" ]
do
   echo "============== creating container $i =============="
   docker run -itd --name fool_$i --hostname fool_$i -v /home/workspace/dev-data:/home/workspace/docker_data -p 806$i:8080 shaikghouse/myubuntu /bin/bash
   echo "$(docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' cool_$i)"
   docker cp /target/crepo.war  fool_$i:/home/dev_data/apache-tomcat-9.0.55/webapps
     
   i=$(($i+1))

done


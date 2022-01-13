#!/bin/bash -xe

read=num
read=name
i=1
while [ "$i" -lt "${num}" ]
do
   echo "============== creating container $i =============="
   docker run -itd --name ${name}$i --hostname ${name}$i -v /home/workspace/dev-data:/home/workspace/docker_data -p 806$i:8080 shaikghouse/myubuntu /bin/bash
   echo "$(docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' ${name}$i)"
   docker cp /target/crepo.war ${name}$i:/home/dev_data/apache-tomcat-9.0.55/webapps/
   docker exec -itd ${name}$i:/home/dev_data/apache-tomcat-9.0.55/bin/startup.sh 
   i=$(($i+1))

done


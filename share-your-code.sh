#!/bin/bash
# imageName=html-server-image:v1
# containerName=nginx
# dockerPort=80

printf "choose a image name (format : image-name:tag) : "
read imageName
if [ -n "$1" ]; then
  printf "${imageName}  is set\n"
else
  imageName=html-server-image:v1
  printf "${imageName} set by default\n"
fi

printf "choose a container name : "
read containerName
if [ -n "$1" ]; then
  printf "${containerName}  is set\n"
else
  containerName=nginx
  printf "${containerName} set by default\n"
fi

printf "choose docker port : "
read dockerPort
if [ -n "$1" ]; then
  printf "${dockerPort}  is set\n"
else
  dockerPort=80
  printf "${dockerPort} set by default\n"
fi

printf Start building container with image name $imageName
docker build -t $imageName -f Dockerfile  .

printf Delete previous container...
docker rm -f $containerName

printf Run new container...
docker run -d -p $dockerPort:$dockerPort --name $containerName $imageName

printf "ngrok start running ...\n"
sleep 5
reverse_proxy="./ngrok http http://localhost"
reverse_proxy+= $dockerPort
eval $reverse_proxy

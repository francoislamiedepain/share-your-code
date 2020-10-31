#!/bin/bash
# imageName=html-server-image:v1
# containerName=nginx
# dockerPort=80

echo "choose a image name (format : image-name:tag) : "
read imageName
if [ -n "$1" ]; then
  echo "${imageName}  is set"
else
  imageName=html-server-image:v1
  echo "${imageName} set by default"
fi

echo "choose a container name : "
read containerName
if [ -n "$1" ]; then
  echo "${containerName}  is set"
else
  containerName=nginx
  echo "${containerName} set by default"
fi

echo "choose docker port : "
read dockerPort
if [ -n "$1" ]; then
  echo "${dockerPort}  is set"
else
  dockerPort=80
  echo "${dockerPort} set by default"
fi

echo Start building container with wimage name $imageName
docker build -t $imageName -f Dockerfile  .

echo Delete previous container...
docker rm -f $containerName

echo Run new container...
docker run -d -p $dockerPort:$dockerPort --name $containerName $imageName

echo "ngrok start running ..."
sleep 10
reverse_proxy="./ngrok http http://localhost"
reverse_proxy+= $dockerPort
eval $reverse_proxy

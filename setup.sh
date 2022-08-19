#!/bin/bash
# Preparing docker image and container
docker build --no-cache -t kali/msfconsole:0.1 .

id=$(docker ps -a -f name=kali_rolling -q)
if [[ ! -z $id ]];then
    echo "[+] already exist. Deleting kali_rolling($id)"
    docker stop $id && docker rm $id
fi

docker run -d -v local_volume:/var/lib/postgresql --name kali_rolling kali/msfconsole:0.1
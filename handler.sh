#!/bin/bash
# set -e

 cd `dirname $0`
 
 if [[ $# -le 1 ]];then
     echo "Usage: $0 {multihandler.rc.txt} {your port} <workspace>"; exit 1
 fi

WORKSPACE=$3
PORT=$2
# sed -i.bak -e "s/{{workspace}}/${WORKSPACE:-default}/g" $1
sed -i.bak -e "s/{{workspace}}/${WORKSPACE:-default}/g" -e "s/{{YOUR_PORT}}/${PORT:-8500}/g" $1
rcfile=$(cat $1)
mv $1.bak $1

echo "[+] Run container(msf_handler)..."
IP=$(ip address show label eth0 scope global | grep -P -o '1[0-9]{0,2}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(?=/)')
echo "[+] Recived IP(your host) is ${IP:-unknown(Please check your ip \`ip add\`)} and port tcp/$PORT"

docker run --rm -it --name msf_handler -v "${HOME}/.msf4_container:/root/.msf4" -p $PORT:$PORT kali/msfconsole:0.1 msfconsole '-x' "$rcfile"
#  docker run --rm -it --name msf_handler -v "${HOME}/.msf4_container:/root/.msf4" -p 8490-8500:8490-8500 kali/msfconsole:0.1 msfconsole "$@"
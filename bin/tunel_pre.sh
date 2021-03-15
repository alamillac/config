#!/bin/sh

# kill all running ssh if -k is passed as argument
while getopts "k" opt; do
   case "$opt" in
      k)
         echo "WARNING: Killing ALL ssh connections!"
         ps aux | grep ssh | awk '{ printf $1"\n" }' | xargs -r kill -9
         ;;
   esac
done

# ports (MariaDB, Beanstalkd, Redis, Mongo, Elasticsearch)
PORTS=(3306 11300 6379 27017 9300)
USERNAME=ubuntu
SERVER=pre.unnax.net

# connect to all
for i in "${PORTS[@]}"
do
  # add  -i /path/to/priv/key before &, to use a private key file
  ssh -N -L :$i:$SERVER:$i $USERNAME@$SERVER &
done

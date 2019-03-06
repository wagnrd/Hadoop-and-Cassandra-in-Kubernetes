#!/bin/bash

SEED_NAME=casMain

if [ -n "$2" ]
then
	SEED_NAME=$2
fi

case $1 in
	seed)
		docker run -d --name $SEED_NAME --network casNet cassandra
		;;
	node)
		SEED_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $SEED_NAME)
		docker run -d --network casNet cassandra $SEED_IP
		;;
	status)
		docker exec casMain nodetool status
		;;
	killall)
		docker rm $(sudo docker ps -a -q) --force
		;;
	*)
		echo "seed    - Creates a seed node"
		echo "node    - Creates a normal node"
		echo "status  - Shows the nodetool status of the seed node"
		echo "killall - Kills all containers"
		;;
esac

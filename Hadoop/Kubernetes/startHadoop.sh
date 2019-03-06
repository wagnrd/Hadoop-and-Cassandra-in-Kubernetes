#!/bin/sh

start() {
	kubectl create -f hdfs-namenode.yaml
	kubectl create -f yarn-resourcemanager.yaml
	kubectl create -f historyserver.yaml
	kubectl create -f datanode.yaml
}

stop() {
	kubectl delete statefulsets --all
	kubectl delete service hdfs-namenode-service
	kubectl delete service hdfs-namenode-service-extern
	kubectl delete service datanode-service
	kubectl delete service datanode-service-extern
	kubectl delete service yarn-resourcemanager-service
	kubectl delete service yarn-resourcemanager-service-extern
	kubectl delete service historyserver-service
	kubectl delete service historyserver-service-extern
}

case "$1" in
	"start")
		start
    	;;
	"restart")
		stop
		start
		;;
	"stop")
		stop
		;;
	"vm")
		minikube start --cpus 3 --memory 4098
		;;
	*)
		echo "Help"
		echo ""
		echo "start:   Starts the cluster"
		echo "restart: Restarts the cluster"
		echo "stop:    Deletes the cluster"
		echo "vm:      Starts minikube"
esac

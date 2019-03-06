#!/usr/bin/env bash

IP=$(hostname --ip-address)

sed -i -e "s/^rpc_address.*/rpc_address: $IP/" $CASSANDRA_CONFIG/cassandra.yaml
sed -i -e "s/^listen_address.*/listen_address: $IP/" $CASSANDRA_CONFIG/cassandra.yaml

SEED=$IP
if [ -n "$1" ]
then
	SEED=$1
fi
sed -i -e "s/- seeds: \"127\.0\.0\.1\"/- seeds: \"$SEED\"/" $CASSANDRA_CONFIG/cassandra.yaml

exec cassandra -Rf

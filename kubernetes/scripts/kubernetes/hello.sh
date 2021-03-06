#!/usr/bin/env bash

while true
do
    DOCKER_MACHINE_ACTIVE=`docker-machine active`
    DOCKER_IP=`docker-machine ip $DOCKER_MACHINE_ACTIVE`
    KUBERNETES_NODE_PORT=`kubectl get -o yaml service/ccc-api | grep nodePort | awk -F'- nodePort: ' '{print $2}'`
    curl -X GET -w "\n" http://${DOCKER_IP}:${KUBERNETES_NODE_PORT}/api/hello
    sleep 1
done
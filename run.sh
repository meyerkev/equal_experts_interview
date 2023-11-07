#!/bin/bash

set -eou pipefail

# Start minikube
# minikube start
# sudo minikube tunnel&

# Set docker env
# eval $(minikube -p minikube docker-env)

# Build image
docker build -t local-hello-world .

minikube image load local-hello-world --overwrite

# Note that we didn't set -e, so this is idempotent
kubectl create namespace hello-world || echo "Namespace already exists"

kubectl apply -f .
echo "To delete, run kubectl delete -f . or kubectl delete all if you have an isolated namespace"
echo "Give it a minute or two, then run curl <the elb>/"

echo "Sleeping 10 seconds to give the service time to start"
sleep 10
# Normally, this would be a hostname, but minikube doesn't support that so it's an IP
ENDPOINT=$(minikube service hello-world --url -n hello-world)

echo "Testing endpoint $ENDPOINT/"

while true; do
    curl $ENDPOINT/ && break
    sleep 10
done
# equal_experts_interview

This is a solution to the "Mini Kube" takehome.  

## Prerequisites

- `minikube`
- `kubectl`
    - `alias kubectl="minikube kubectl"` works just fine
- `docker` to build the image

## Running the code


```bash
# Turn up minikube
minikube start

# Enable load balancers in minikube
# This is blocking, but sudo minkube tunnel& generally also works
minikube tunnel  

# So in a second terminal
./run.sh
```

`run.sh` will build the docker image, load it into minikube, and then deploy the deployment and service yaml's to enable the servicve, block on the service coming up, and then curl the endpoint of the service
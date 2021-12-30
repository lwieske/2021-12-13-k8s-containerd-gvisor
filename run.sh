#!/usr/bin/env bash

minikube start \
    --kubernetes-version=v1.23.0 \
    --container-runtime=containerd \
    --driver=hyperkit

sleep 60

set +x
echo "################################################################################"
echo "### enable minikube addon gvisor"
echo "################################################################################"
set -x

minikube addons enable gvisor

kubectl get pod,runtimeclass gvisor -n kube-system

sleep 20

kubectl get pods --all-namespaces

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod-runsc
spec:
  runtimeClassName: gvisor
  containers:
  - name: nginx
    image: nginx:1.21.4-alpine
EOF

sleep 20

minikube ssh "systemctl --full --no-pager status containerd.service"

#!/usr/bin/env bash

# Edit this line, setting your EC2 worker node IAM role name
ROLE_NAME=eksctl-kCluster-nodegroup-web-ser-NodeInstanceRole-6350U8Y1Z1RQ
##-- DO NOT EDIT BELOW THIS LINE --##

aws iam put-role-policy --role-name $ROLE_NAME --policy-name Logs-Policy-For-Worker --policy-document file://k8s-logs-policy.json
aws iam get-role-policy --role-name $ROLE_NAME --policy-name Logs-Policy-For-Worker
kubectl apply -f cluster-role.yml
#kubectl apply -f fluentd-config-map.yml
#kubectl apply -f fluentd.yml

kubectl create namespace amazon-cloudwatch
kubectl create configmap fluent-bit-cluster-info \
--from-literal=cluster.name=kCluster \
--from-literal=http.server=Off \
--from-literal=http.port=2020 \
--from-literal=read.head=Off \
--from-literal=read.tail=On \
--from-literal=logs.region=us-east-1 -n amazon-cloudwatch

kubectl apply -f fluent-bit.yml
kubectl get pods -w --namespace=kube-system -l k8s-app=fluentd-cloudwatch
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml


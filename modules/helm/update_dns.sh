#!/bin/bash

source ./secret.sh

region="us-west-1"
cluster_name="blogapp-liz"
domain1="blogapp-portfolio.duckdns.org"
domain2="argo-cd-liz.duckdns.org"
domain3="lizs-kibana.duckdns.org"
domain4="grafana-liz.duckdns.org"

sleep 5
aws eks --region $region update-kubeconfig --name $cluster_name
lb=$(kubectl get svc | grep -i load | awk '{print $4}')
ip=$(dig $lb | grep $lb | tail -n 1 | awk '{print $5}')
curl -k "https://www.duckdns.org/update?domains=$domain1&token=$token&ip=$ip"    
curl -k "https://www.duckdns.org/update?domains=$domain2&token=$token&ip=$ip" 
curl -k "https://www.duckdns.org/update?domains=$domain3&token=$token&ip=$ip" 
curl -k "https://www.duckdns.org/update?domains=$domain4&token=$token&ip=$ip" 

echo "\nip adress $ip assigned to:"
echo "blogapp: https://$domain1/"
echo "argo-cd: https://$domain2/"
echo "argo-cd password is:"
kubectl get secret argocd-initial-admin-secret -o\
 jsonpath="{.data.password}" | base64 -d; echo
echo "logging: https://$domain3/"
echo "monitoring: https://$domain4/"
kubectl get secret prometheus-grafana -o\
 jsonpath="{.data.admin-password}" | base64 --decode ; echo
# efk-dash-"http://localhost:8000/app/dashboards#/view/0d4dc6c0-650b-11ed-ae21-0b63ff292cf8?_g=(filters%3A!()%2CrefreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3A'2022-11-15T16%3A22%3A22.931Z'%2Cto%3A'2022-11-15T16%3A30%3A45.102Z'))"
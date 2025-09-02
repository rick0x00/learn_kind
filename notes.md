# Learning Kind

helmfile sync

kubectl patch deployment argocd-server -n argocd --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--insecure"}]'
# desfazendo o step anteior
# kubectl get deployment argocd-server -n argocd -o yaml |   sed '/- --insecure/d' |   kubectl apply -f - 
kubectl get pods -n argocd -w


helm show values grafana/grafana > grafana-default-values.yaml

kubectl get svc --namespace argocd
kubectl get svc -n ingress-nginx

kubectl describe svc argocd-server -n argocd

kubectl describe svc ingress-nginx-controller -n ingress-nginx
kubectl describe svc ingress-nginx-controller-admission -n ingress-nginx

kubectl get ingress --all-namespaces

kubectl get pods -n ingress-nginx
kubectl logs -n ingress-nginx ingress-nginx-controller-bd44dc47-clmn4 | tail -n 10


# get actual argocd pass
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d





## debug error: You must be logged in to the server (the server has asked for the client to provide credentials ( pods/log ingress-nginx-controller-bd44dc47-clmn4))

kind get clusters

kind get kubeconfig --name wsl-dev > ~/.kube/config



### find . \( $EXCLUDED_DIRS \) -prune -o -type f -exec bash -c "echo '### => {}' ; cat {}" \;

EXCLUDED_DIRS=" -path ./.git -o -path ./default_values_ref"
find . \( $EXCLUDED_DIRS \) -prune -o -type f -exec bash -c "echo '### => {}'" \;
find . \( $EXCLUDED_DIRS \) -prune -o -type f -exec bash -c "echo '### => {}' ; cat {} " \;



kind create cluster --config kind-config-ingress.yaml --name wsl-dev


kind get clusters
kind create cluster --config kind-config-ingress.yaml --name wsl-dev
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s


  468  kind get clusters
  469  kind delete cluster name desktop
  470  kind delete cluster --name desktop
  471  kind delete cluster --name kind
  472  tree
  473  kind get clusters
  474  kind create cluster --config kind-config-ingress.yaml --name wsl-dev
  475  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
  476  kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
  477  helmfile sync
  478  history


  kubectl get ingress --all-namespaces


  curl -k http://127.0.0.1 -H "Host: hello.test"

  curl -k http://127.0.0.1 -H "Host: argocd.test"


kubectl run -it --rm --image=busybox:1.28 dns-test -- nslookup kafka-sts-0.kafka-service.kafka.svc.cluster.local


EXCLUDED_DIRS=" -path ./.git -o -path ./default_values_ref"
find . \( $EXCLUDED_DIRS \) -prune -o -type f -exec bash -c "echo '### => {}'" \;
### => ./.github/workflows/validate-manifests.yml
### => ./apps/helloworld/1-namespace.yaml
### => ./apps/helloworld/2-deployment.yaml
### => ./apps/helloworld/3-service-ingress.yaml
### => ./apps/kafka/1-namespace.yaml
### => ./apps/kafka/2-zookeeper.yaml
### => ./apps/kafka/3-kafka.yaml
### => ./apps/kafka/4-kafka-ui.yaml
### => ./apps/kafka/5-init-kafka.yaml
### => ./apps/kafka/6-kafka-ui-ingress.yaml
### => ./argocd-apps/appset-discover-apps.yaml
### => ./argocd-apps/kafka-app.yaml
### => ./argocd-values.yaml
### => ./grafana-values.yaml
### => ./helmfile.yaml
### => ./install_task-manager.sh
### => ./kind-config-ingress.yaml
### => ./LICENSE
### => ./notes.md
### => ./README.md
### => ./Taskfile.yml


EXCLUDED_DIRS=" -path ./.git -o -path ./default_values_ref"
find . \( $EXCLUDED_DIRS \) -prune -o -type f -exec bash -c "echo '### => {}' ; cat {} " \;



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
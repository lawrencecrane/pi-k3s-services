## Create secret for Pihole

```
kubectl create secret generic pihole-webpasswd --from-literal=webpasswd="<password>"
```

## Create ConfigMap for wildcard.conf

``` 
kubectl create configmap pihole-wildcard-config --from-file=wildcard.conf
``` 

## Deploy pihole

``` 
kubectl apply -f pihole.yaml
```

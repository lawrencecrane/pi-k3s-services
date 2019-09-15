## Create secret for Pihole

kubectl create secret generic pihole-webpasswd --from-literal=webpasswd="<password>"

## Deploy pihole

kubectl apply -f pihole.yaml

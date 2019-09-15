#!/bin/bash

create_certificates () {
  openssl req -x509 -newkey rsa:4096 -nodes \
    -keyout /opt/k8s/.ssl/key.pem -out /opt/k8s/.ssl/cert.pem -days 3650 \
    -subj "/C=FI/ST=FI/L=Finland/O=Bind/OU=Bind/CN=$(hostname)"
}

enable_trust () {
  cp /opt/k8s/.ssl/cert.pem /usr/local/share/ca-certificates/registry.crt && \
  update-ca-certificates
}

add_secret_to_k8s () {
  kubectl --namespace=kube-system create secret tls registry-ingress-tls \
    --cert=/opt/k8s/.ssl/cert.pem --key=/opt/k8s/.ssl/key.pem
}

create_certificates && enable_trust && add_secret_to_k8s

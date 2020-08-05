FROM alpine:latest

ENV KUSTOMIZE_VERSION v3.8.1

WORKDIR /tmp

RUN apk add --virtual .build-deps --no-cache curl &&\
    wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz &&\
    tar xf kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz &&\ 
    mv kustomize /usr/bin/kustomize &&\
    kustomize version &&\
    wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz &&\
    tar xf kubeval-linux-amd64.tar.gz &&\
    mv kubeval /usr/local/bin/kubeval &&\
    kubeval --version &&\
    apk add --virtual .build-deps git

WORKDIR /

CMD [ "kubeval" ]

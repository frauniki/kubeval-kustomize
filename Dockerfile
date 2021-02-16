FROM alpine:latest

WORKDIR /tmp

RUN apk add --virtual .build-deps --no-cache curl bash &&\
    curl -s https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh | bash &&\
    mv kustomize /usr/bin/kustomize &&\
    kustomize version &&\
    wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz &&\
    tar xf kubeval-linux-amd64.tar.gz &&\
    mv kubeval /usr/local/bin/kubeval &&\
    kubeval --version &&\
    apk add --virtual .build-deps git

WORKDIR /

CMD [ "kubeval" ]

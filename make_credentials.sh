#!/bin/bash
if [ -d $HOME/.kube ]
then
    echo $KUBE_CREDENTIALS_CERTIFICATE > $HOME/.kube/kubectl.yaml
else
    mkdir $HOME/.kube
    echo $KUBE_CREDENTIALS_CERTIFICATE > $HOME/.kube/kubectl.yaml
fi


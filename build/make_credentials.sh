#!/bin/sh
mkdir .kube
if [ -z "$KUBERNETES_TOKEN" ]
then
	>&2 echo "KUBERNETES_TOKEN variable not set"
	exit 22
fi
if [ -f $HOME/.kube/config ]
then
	>&2 echo "Kubeconfig file already exists"
	exit 17
fi
printf "apiVersion: v1\nkind: Config\nclusters:\n- name: \"cluster\"\n  cluster:\n    server: \"https://gr2-mgmt.cloud.sdu.dk/k8s/clusters/c-rzgbl\"\n\nusers:\n- name: \"cluster\"\n  user:\n    token: \"$KUBERNETES_TOKEN\"\n\ncontexts:\n- name: \"cluster\"\n  context:\n    user: \"cluster\"\n    cluster: \"cluster\"\n\ncurrent-context: \"cluster\"\n" > $HOME/.kube/config

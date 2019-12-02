#!/bin/bash
if [ -z "$DOCKER_USERNAME" ]
then
	>&2 echo "Docker username not provided"
	exit 126
fi

if [ -z "$DOCKER_PASSWORD" ]
then
	>&2 echo "Docker password not provided"
	exit 126
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker tag kubectl:latest dm874/deploy
docker push dm874/deploy

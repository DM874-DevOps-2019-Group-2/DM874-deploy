#!/bin/bash

if [ -z "$KUBERNETES_TOKEN" ]
then
	>&2 echo "KUBERNETES_TOKEN not set"
	exit 22
fi

if [ -z "$TRAVIS_COMMIT" ]
then
	>&2 echo "TRAVIS_COMMIT not set"
	exit 22
fi

if [ -z "$DOCKERHUB_REPO_MIGRATIONS" ]
then
	>&2 echo "DOCKERHUB_REPO_MIGRATIONS not set"
	exit 22
fi

if [ -z "$KUBERNETES_STS_NAME" ]
then
	>&2 echo "KUBERNETES_STS_NAME not set"
	exit 22
fi

if [ -z "$KUBERNETES_CONTAINER_NAME" ]
then
	>&2 echo "KUBERNETES_CONTAINER_NAME not set"
	exit 22
fi

docker run \
	--env KUBERNETES_TOKEN \
	--env DOCKER_IMAGE_SLUG=$DOCKERHUB_REPO_MIGRATIONS \
	--env DOCKER_IMAGE_TAG=$TRAVIS_COMMIT \
	--env SERVICE=$KUBERNETES_STS_NAME \
	--env CONTAINER=$KUBERNETES_CONTAINER_NAME \
	dm874/deploy 

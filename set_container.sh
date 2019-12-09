#!/bin/sh

# Expected variables: 

if [ -z "$DOCKER_IMAGE_SLUG" ]
then
	>&2 echo "Docker image slug not set"
	exit 22
fi

if [ -z "$DOCKER_IMAGE_TAG" ]
then
	>&2 echo "Docker image tag not set"
	exit 22
fi

if [ -z "$SERVICE" ]
then
	>&2 echo "Kubernetes service name not set"
	exit 22 
fi

if [ -z "$CONTAINER" ]
then
	>&2 echo "Kubernetes container name not set"
	exit 22 
fi

echo "Running: kubectl set image statefulset/$SERVICE $CONTAINER=$DOCKER_IMAGE_SLUG:$DOCKER_IMAGE_TAG"
kubectl set image statefulset/$SERVICE $CONTAINER=$DOCKER_IMAGE_SLUG:$DOCKER_IMAGE_TAG

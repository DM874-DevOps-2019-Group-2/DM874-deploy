#!/bin/sh

# Expected Variables: DOCKER_USERNAME, DOCKER_PASSWORD, SOURCE_IMAGE, OWNER, REPO, TAG

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker tag $SOURCE_IMAGE:$TAG $OWNER/$REPO:$TAG
docker push $OWNER/$REPO


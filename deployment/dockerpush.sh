#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
#CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="nodejs-webapp"
TRAVIS_BUILD_NUMBER="newversion"
#BUILD_DATE="date -u +%Y-%m-%dT%H:%M:%SZ"
#BUILD_DATE="$(date)"

REGISTRY="munisanath"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER} .
docker tag ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER} ${REGISTRY}/${IMAGE_NAME}:latest
docker push ${REGISTRY}/${IMAGE_NAME}
docker tag ${REGISTRY}/${IMAGE_NAME}:latest ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER}
docker push ${REGISTRY}/${IMAGE_NAME}
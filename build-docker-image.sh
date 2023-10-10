#!/usr/bin/env sh

# Variables
TAG=latest
NAME=igor875126/project-zomboid
IMAGENAME=${NAME}:${TAG}

# Build docker image
docker build -t ${IMAGENAME} -f docker/Dockerfile .

# Push
docker push ${IMAGE}:${TAG}
#!/usr/bin/env sh

# Variables
TAG=latest
NAME=docker.io/igor875126/project-zomboid
IMAGENAME=${NAME}:${TAG}

# Build docker image
docker build -t ${IMAGENAME} .

# Push
docker push ${IMAGENAME}
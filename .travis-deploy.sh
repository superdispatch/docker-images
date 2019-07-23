#!/usr/bin/env bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

if [[ $TRAVIS_TAG =~ (^[0-9]+.[0-9]+.[0-9]+-node-pipeline$) ]]
then
    export TAG=${TRAVIS_TAG//-node-pipeline/}
    docker tag superdispatch/node-pipeline superdispatch/node-pipeline:${TAG}
    docker tag superdispatch/node-pipeline superdispatch/node-pipeline:latest
else
    echo Invalid tag \"$TRAVIS_TAG\".
    exit 1
fi

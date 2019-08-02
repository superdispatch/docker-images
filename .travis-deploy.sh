#!/usr/bin/env bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

if [[ $TRAVIS_TAG =~ (^[0-9]+.[0-9]+.[0-9]+-node-pipeline$) ]]
then
    export TAG=${TRAVIS_TAG//-node-pipeline/}
    docker tag superdispatch/node-pipeline superdispatch/node-pipeline:${TAG}
    docker tag superdispatch/node-pipeline superdispatch/node-pipeline:latest
    docker push superdispatch/node-pipeline:${TAG}
    docker push superdispatch/node-pipeline:latest
    curl -X POST https://hooks.microbadger.com/images/superdispatch/node-pipeline/${MICROBADGER_NODE_ID} > /dev/null
else
    echo Invalid tag \"$TRAVIS_TAG\".
    exit 1
fi

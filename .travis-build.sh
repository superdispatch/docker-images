#!/usr/bin/env bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Node Pipeline
docker pull superdispatch/node-pipeline || true
docker build --pull --cache-from superdispatch/node-pipeline --tag superdispatch/node-pipeline node-pipeline
docker run --rm -v $(pwd)/node-pipeline/test.sh:/test.sh superdispatch/node-pipeline bash test.sh

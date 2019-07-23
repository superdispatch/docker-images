#!/usr/bin/env bash

#
# Node Pipeline
#

docker pull superdispatch/node-pipeline || true
docker build --pull --cache-from superdispatch/node-pipeline --tag superdispatch/node-pipeline node-pipeline
docker run --rm superdispatch/node-pipeline \
    echo "user: $(whoami)" && \
    echo "node: $(node --version)" && \
    echo "npm: $(npm --version)" && \
    echo "yarn: $(yarn --version)" && \
    echo "firebase: $(firebase --version)" && \
    echo "sentry: $(sentry-cli --version)" && \
    echo "Google Cloud SDK" && \
    gcloud --version && \
    kubectl version --client

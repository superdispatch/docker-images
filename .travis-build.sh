#!/usr/bin/env bash

# Node Pipeline
docker pull superdispatch/node-pipeline:latest || true
docker build --pull --cache-from superdispatch/node-pipeline:latest --tag superdispatch/node-pipeline node-pipeline
docker run --rm -v $(pwd)/node-pipeline/test.sh:/test.sh superdispatch/node-pipeline bash test.sh

#!/usr/bin/env bash

#
# Node Pipeline
#

# 1. Pull
docker pull superdispatch/node-pipeline || true
# 2. Build
docker build --pull --cache-from superdispatch/node-pipeline --tag superdispatch/node-pipeline node-pipeline
# 3. Test
docker run --rm -v $(pwd)/node-pipeline/test.sh:/test.sh superdispatch/node-pipeline bash test.sh

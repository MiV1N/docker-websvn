#!/bin/bash

WEBSVN_VERSION="2.6.1"

docker build -t yoshihide1981/websvn:${WEBSVN_VERSION} \
    --build-arg WEBSVN_REFS=tags \
    --build-arg WEBSVN_VERSION=${WEBSVN_VERSION} \
    .
docker build -t yoshihide1981/websvn:latest \
    --build-arg WEBSVN_REFS=heads \
    --build-arg WEBSVN_VERSION=master \
    .

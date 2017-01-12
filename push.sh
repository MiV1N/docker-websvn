#!/bin/bash

WEBSVN_VERSION="2.6.1"

docker push yoshihide1981/websvn:latest
docker push yoshihide1981/websvn:${WEBSVN_VERSION}

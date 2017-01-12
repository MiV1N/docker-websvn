#!/bin/bash

WEBSVN_VERSION="2.6.1"

docker run --name websvn-test --rm -p 80:80 \
    -e repository=http://svn.osdn.net/svnroot/ttssh2/ \
    yoshihide1981/websvn:latest

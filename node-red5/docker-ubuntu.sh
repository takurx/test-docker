#!/bin/bash
export NODE_RED_VERSION=$(grep -oE "\"node-red\": \"(\w*.\w*.\w*.\w*.\w*.)" package.json | cut -d\" -f4)

echo "#########################################################################"
echo "node-red version: ${NODE_RED_VERSION}"
echo "#########################################################################"

docker build --rm --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=16 \
    --build-arg NODE_RED_VERSION=${NODE_RED_VERSION} \
    --build-arg OS_NODE=buster-slim \
	--build-arg OS_ROS2=ubuntu \
    --build-arg OS_ROS2_TAG=focal \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile.ubuntu \
    --tag testing:node-red-build-ubuntu .
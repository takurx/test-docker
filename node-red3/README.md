# Log
- Dockerfile.debianからcopy and paste
- shell scriptがなさげ

- node-red-docker/docker-custom at master · node-red/node-red-docker
    - https://github.com/node-red/node-red-docker/tree/master/docker-custom

```
chiya@ujimatsu:~/JetsonWorks3/test-docker/node-red3$ sudo docker build -t takurx/node-red:1.0 .
Sending build context to Docker daemon  6.656kB
Step 1/31 : ARG ARCH=amd64
Step 2/31 : ARG NODE_VERSION=16
Step 3/31 : ARG OS=buster-slim
Step 4/31 : FROM ${ARCH}/node:${NODE_VERSION}-${OS} AS base
 ---> f126d2350f3f
Step 5/31 : COPY scripts/*.sh /tmp/
COPY failed: no source files were specified
```

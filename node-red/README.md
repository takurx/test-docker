# Log
- Image Layer をコピペしただけでは無理っぽい

- Image Layer Details - nodered/node-red:2.2.2-12 | Docker Hub
    - https://hub.docker.com/layers/nodered/node-red/2.2.2-12/images/sha256-ad4fbab5a1a531663622cfd11c584a9f2131acb78b2e3c6b6b09822ab945d88f?context=explore

```
Sending build context to Docker daemon  8.704kB
Step 1/33 : FROM ubuntu:22.04
 ---> 58db3edaf2be
Step 2/33 : ADD file:8f5bc5ce64ef781adadca88e4004e17affc72e6f20dbd08b9c478def12fe1dd3 in /
ADD failed: file not found in build context or excluded by .dockerignore: stat file:8f5bc5ce64ef781adadca88e4004e17affc72e6f20dbd08b9c478def12fe1dd3: file does not exist
```

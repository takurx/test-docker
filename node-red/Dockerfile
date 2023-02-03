FROM ubuntu:22.04
ADD file:8f5bc5ce64ef781adadca88e4004e17affc72e6f20dbd08b9c478def12fe1dd3 in /
CMD ["/bin/sh"]
ENV NODE_VERSION=12.22.8
RUN /bin/sh -c addgroup -g 1000 node     && adduser -u 1000 -G node -s /bin/sh -D node     && apk add --no-cache         libstdc++     && apk add --no-cache --virtual .build-deps         curl     && ARCH= && alpineArch="$(apk --print-arch)"       && case "${alpineArch##*-}" in         x86_64)           ARCH='x64'           CHECKSUM="9cc1d120c404d66a62d6e4daaba361e8e1996bdc5b9643f97bbd1241247332df"           ;;         *) ;;       esac   && if [ -n "${CHECKSUM}" ]; then     set -eu;     curl -fsSLO --compressed "https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz";     echo "$CHECKSUM  node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" | sha256sum -c -       && tar -xJf "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" -C /usr/local --strip-components=1 --no-same-owner       && ln -s /usr/local/bin/node /usr/local/bin/nodejs;   else     echo "Building from source"     && apk add --no-cache --virtual .build-deps-full         binutils-gold         g++         gcc         gnupg         libgcc         linux-headers         make         python2     && for key in       4ED778F539E3634C779C87C6D7062848A1AB005C       94AE36675C464D64BAFA68DD7434390BDBE9B9C5       74F12602B6F1C4E913FAA37AD3A89613643B6201       71DCFD284A79C3B38668286BC97EC7A07EDE3FC1       8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600       C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8       C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C       DD8F2338BAE7501E3DD5AC78C273792F7D83545D       A48C2BEE680E841632CD4E44F07496B3EB3C1762       108F52B48DB57BB0CC439B2997B01419BD92F80A       B9E2F5981AA6E0CD28160D9FF13993A75599653C     ; do       gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" ||       gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ;     done     && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz"     && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc"     && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc     && grep " node-v$NODE_VERSION.tar.xz\$" SHASUMS256.txt | sha256sum -c -     && tar -xf "node-v$NODE_VERSION.tar.xz"     && cd "node-v$NODE_VERSION"     && ./configure     && make -j$(getconf _NPROCESSORS_ONLN) V=     && make install     && apk del .build-deps-full     && cd ..     && rm -Rf "node-v$NODE_VERSION"     && rm "node-v$NODE_VERSION.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt;   fi   && rm -f "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz"   && apk del .build-deps   && node --version   && npm --version
ENV YARN_VERSION=1.22.17
RUN /bin/sh -c apk add --no-cache --virtual .build-deps-yarn curl gnupg tar   && for key in     6A010C5166006599AA17F08146C2130DFD2497F5   ; do     gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" ||     gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ;   done   && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz"   && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc"   && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz   && mkdir -p /opt   && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/   && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn   && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg   && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz   && apk del .build-deps-yarn   && yarn --version
COPY file:4d192565a7220e135cab6c77fbc1c73211b69f3d9fb37e62857b2c6eb9363d51 in /usr/local/bin/ 
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node"]
ARG QEMU_ARCH
COPY .docker/scripts/*.sh /tmp/ # buildkit
COPY .docker/healthcheck.js / # buildkit
RUN |1 QEMU_ARCH= /bin/sh -c set -ex &&     apk add --no-cache         bash         tzdata         iputils         curl         nano         git         openssl         openssh-client         ca-certificates &&     mkdir -p /usr/src/node-red /data &&     deluser --remove-home node &&     adduser -h /usr/src/node-red -D -H node-red -u 1000 &&     chown -R node-red:root /data && chmod -R g+rwX /data &&     chown -R node-red:root /usr/src/node-red && chmod -R g+rwX /usr/src/node-red # buildkit
WORKDIR /usr/src/node-red
COPY .docker/known_hosts.sh . # buildkit
RUN |1 QEMU_ARCH= /bin/sh -c ./known_hosts.sh /etc/ssh/ssh_known_hosts && rm /usr/src/node-red/known_hosts.sh # buildkit
COPY package.json . # buildkit
COPY flows.json /data # buildkit
ARG BUILD_DATE
ARG BUILD_VERSION
ARG BUILD_REF
ARG NODE_RED_VERSION
ARG ARCH
ARG QEMU_ARCH
ARG TAG_SUFFIX
LABEL org.label-schema.build-date=2022-02-18T21:01:00Z org.label-schema.docker.dockerfile=.docker/Dockerfile.alpine org.label-schema.license=Apache-2.0 org.label-schema.name=Node-RED org.label-schema.version=2.2.2 org.label-schema.description="Low-code programming for event-driven applications. org.label-schema.url=https://nodered.org org.label-schema.vcs-ref= org.label-schema.vcs-type=Git org.label-schema.vcs-url=https://github.com/node-red/node-red-docker org.label-schema.arch= authors=Dave Conway-Jones, Nick O Leary, James Thomas, Raymond Mouthaan"
COPY /usr/src/node-red/prod_node_modules ./node_modules # buildkit
RUN |7 BUILD_DATE=2022-02-18T21:01:00Z BUILD_VERSION=2.2.2 BUILD_REF= NODE_RED_VERSION=v2.2.2 ARCH= QEMU_ARCH= TAG_SUFFIX= /bin/sh -c chown -R node-red:root /usr/src/node-red &&     /tmp/install_devtools.sh &&     rm -r /tmp/* # buildkit
USER node-red
ENV NODE_RED_VERSION=v2.2.2 NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules PATH=/usr/src/node-red/node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin FLOWS=flows.json
EXPOSE map[1880/tcp:{}]
#HEALTHCHECK &{["CMD-SHELL" "node /healthcheck.js"] "0s" "0s" "0s" '\x00'}
ENTRYPOINT ["npm" "--no-update-notifier" "--no-fund" "start" "--cache" "/data/.npm" "--" "--userDir" "/data"]

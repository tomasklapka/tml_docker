FROM alpine:edge

ENV TAU_COMMIT 50c2883

RUN addgroup -S tau \
    && adduser -S tau -G tau --home /tmp/tau \
    && apk add libstdc++ libgcc \
    && apk add --no-cache --virtual .build-deps g++ git \
    && git clone "https://github.com/IDNI/tau" /home/tau/build \
    && cd /home/tau/build \
    && git reset --hard $TAU_COMMIT \
    && g++ -std=c++1y tml.cpp driver.cpp bdd.cpp -W -Wall -Wpedantic -o/bin/tml -O3 -flto \
    && apk del .build-deps \
    && rm -rf /home/tau/build

USER tau
WORKDIR /home/tau
ENTRYPOINT ["/bin/tml"]

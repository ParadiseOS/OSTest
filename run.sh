#!/usr/bin/bash

docker run                                                        \
    -it                                                           \
    --mount type=bind,source="$(pwd)"/build-bin,target=/build-bin \
    ostest

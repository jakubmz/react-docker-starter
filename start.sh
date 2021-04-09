#!/usr/bin/env bash

APP_NAME=reactdockerstarter
docker build . -f Dockerfile -t $APP_NAME && \
docker run --name react-docker-starter -it -p 7000:7000 --rm -v ${PWD}:/app -v ${APP_NAME}_nodemodules:/app/node_modules $APP_NAME $@
# docker run -p 7000:7000/tcp -it --rm -v ${PWD}:/app -v ${APP_NAME}_nodemodules:/app/node_modules --network host $APP_NAME $@
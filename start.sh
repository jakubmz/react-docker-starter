#!/bin/bash
APP_NAME=reactapp
docker build . -f Dockerfile -t ${APP_NAME}
docker run -it --rm -v ${PWD}:/app -v ${APP_NAME}_nodemodules:/app/node_modules --network host ${APP_NAME} $@
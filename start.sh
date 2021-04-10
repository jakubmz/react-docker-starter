#!/usr/bin/env bash

APP_NAME=reactapp
docker build . -f Dockerfile -t $APP_NAME && \
docker run -w /app/${APP_NAME} -it --name $APP_NAME -p 3000:3000 --rm -v ${PWD}:/app -v ${APP_NAME}_nodemodules:/app/node_modules $APP_NAME $@
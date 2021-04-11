#!/usr/bin/env bash

# Cleanup script - only if you want to re-build all

APP_NAME=reactapp

docker stop ${APP_NAME}
docker image rm ${APP_NAME}
docker volume rm ${APP_NAME}_nodemodules
rm -rf ${APP_NAME}
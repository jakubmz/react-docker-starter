# react-docker-starter
A ReactJS + NodeJS in a Docker


## Initial Config

### 1. Create Dockerfile.init with contents:

FROM node:14

WORKDIR /app

CMD bash

### 2. Build node docker image

docker build . -f Dockerfile.init -t reactdockerstarter

### 3. Create react project

docker run -it --rm -v ${PWD}/reactdockerstarter:/app  reactdockerstarter npx create-react-app .

### 4. Inside container change foler permissions - probably owned by root

sudo chown -R ${USER} reactdockerstarter

### 5. Delete node_modules folder to avoid platform conflicts

rm -rf node_modules


## Development Config

### 1. Create reactdockerstarter/Dockerfile with contents to run app from local directory:

FROM node:14

WORKDIR /app

COPY package.json yarn.lock /app/

RUN yarn install

EXPOSE 3000

CMD bash

### 2. Create start.sh script with contents:

\#!/bin/bash
APP_NAME=reactdockerstarter
docker build . -f Dockerfile -t ${APP_NAME}
docker run -it --rm -v ${PWD}:/app -v ${APP_NAME}_nodemodules:/app/node_modules --network host ${APP_NAME} $@

bash start.sh yarn create react-app .

### 2. Run environment

bash start.sh yarn start

### 3. Edit reactdockerstarter/src/App.js and enjoy the automatic reloading

vim reactdockerstarter/src/App.js


## Maintenance commands

### 1. Add some library

bash run.sh yarn add styled-components

### 2. Build project

bash run.sh yarn build

### 3. Cleanup

docker image rm reactdockerstarter
docker volume rm reactdockerstarter_nodemodules

#!/usr/bin/bash -x

APP_NAME=reactapp

# Initial config (node_modules on localhost)
docker build . -f Dockerfile.init -t ${APP_NAME}
docker run -it --rm -v ${PWD}/${APP_NAME}:/app ${APP_NAME} npx create-react-app .

# Development config (node_modules only inside dockr)
sudo chown -R ${USER} ${APP_NAME}
rm -rf node_modules
# bash -x start.sh yarn add create-react-app
# bash -x start.sh yarn run create-react-app ..
bash -x start.sh yarn install
bash -x start.sh yarn start
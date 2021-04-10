#!/usr/bin/bash -x

APP_NAME=reactapp

# Initial config (node_modules on localhost)
docker build . -f Dockerfile.init -t ${APP_NAME}
docker run -it --rm -v ${PWD}/${APP_NAME}:/app ${APP_NAME} npx create-react-app .
sudo chown -R ${USER} ${APP_NAME}

# Development config (node_modules only inside dockr)
rm -rf node_modules
bash -x start.sh yarn create ${APP_NAME} .
bash -x start.sh yarn start
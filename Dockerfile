FROM node:14

WORKDIR /app

COPY reactapp/package.json reactapp/yarn.lock /app/

RUN yarn install

EXPOSE 7000

CMD bash
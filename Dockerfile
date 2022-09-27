FROM node:8-alpine

ADD . src/

WORKDIR /src

RUN npm i

RUN npm run build

CMD npm run start

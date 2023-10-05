FROM node:lts-alpine AS dev

LABEL maintainer="Bafode Camara"

WORKDIR /app 

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json .

RUN npm install

RUN npm install -g @angular/cli 

COPY . .

EXPOSE 4200

CMD ng serve 
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

FROM node:lts-alpine AS build

WORKDIR /app 

ENV PATH /app/node_modules/.bin:$PATH

WORKDIR /app 

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json .

RUN npm install

RUN npm install -g @angular/cli 

COPY . .

CMD ng build

FROM nginx as prod

COPY --from=build /app/dist/angular-dockerization/ /usr/share/nginx/html

CMD nginx-debug -g "daemon off;"
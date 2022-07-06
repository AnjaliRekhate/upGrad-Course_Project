FROM node:alpine

WORKDIR /app

Copy package*.json ./

RUN npm install

COPY . .

CMD [ "node", "server.js" ]

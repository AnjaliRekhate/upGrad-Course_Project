FROM node:alpine

WORKDIR /app

Copy package*.json ./

RUN npm install

COPY . .

CMD [ "node", "server.js" ]
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy

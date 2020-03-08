FROM node:6.10.3

WORKDIR /app

COPY *.json ./

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

COPY . .

#CMD npm start

CMD node dev-server.js

FROM node:6.10.3

# sudo docker container kill polis-client-admin; sudo docker container rm polis-client-admin; sudo docker image build -t polis-client-admin:1.0 .

# sudo docker container kill polis-client-admin
# sudo docker container rm polis-client-admin
# sudo docker image build -t polis-client-admin:1.0 .
# sudo docker container run --network="host" --publish 5001:5001 --detach --name polis-client-admin polis-client-admin:1.0
# sudo docker logs polis-client-admin
# --network="host" 

WORKDIR /app

COPY *.json ./

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

COPY . .

#CMD npm start

CMD [ "node", "dev-server.js" ]

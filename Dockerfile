FROM node:6.10.3

# sudo docker container kill polis-client-admin; sudo docker container rm polis-client-admin; sudo docker image build -t polis-client-admin:1.0 .

# sudo docker container kill polis-client-admin
# sudo docker container rm polis-client-admin
# sudo docker image build -t polis-client-admin:1.0 .
# sudo docker container run --network="host" --publish 5001:5001 --detach --name polis-client-admin polis-client-admin:1.0
# sudo docker logs polis-client-admin
# --network="host" 

ARG host=localhost
ARG port=5002

ARG static_files_host=localhost
ARG static_files_port=5001

ARG static_files_admin_host=localhost
ARG static_files_admin_port=5002

ARG postgres_host=localhost
ARG postgres_port=5432
ARG postgres_uid=postgres
ARG postgres_pwd=postgres
ARG postgres_db=polis-dev

ENV DOMAIN_OVERRIDE ${host}:${port}
ENV PORT ${port}

ENV STATIC_FILES_HOST ${static_files_host}
ENV STATIC_FILES_PORT ${static_files_port}
ENV STATIC_FILES_ADMINDASH_PORT ${static_files_admin_port}

WORKDIR /app

COPY . .

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

#CMD npm start

CMD [ "node", "dev-server.js" ]

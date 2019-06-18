FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get install -y nodejs build-essential

RUN apt-get upgrade -y libstdc++6

RUN apt-get install apt-transport-https locales -y

RUN su -c "echo 'nb_NO.UTF-8 UTF-8' > /etc/locale.gen"

RUN su -c "echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen"

RUN locale-gen

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install msodbcsql17 -y

RUN ACCEPT_EULA=Y apt-get install mssql-tools unixodbc-dev -y

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN chmod +x /usr/src/app/import.sh

EXPOSE 8080

CMD /bin/bash ./entrypoint.sh


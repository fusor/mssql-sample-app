# ToDo App built with NodeJS + Express + MSSQL

This is a sample app built with Node JS, Express and MSSQL for demo purpose.

## Installation

### Native Installation

To install the app on your machine, clone this repository.

```bash
git clone git@github.com:pranavgaikwad/mssql-node-sample
```

Before running the app, make sure you have `nodejs` and `npm` installed.

The app connects to MsSQL database. Set following env variables to connect to the db.

```bash
MSSQL_HOST=<DB_SERVER_ADDRESS>
MSSQL_PORT=<DB_PORT>
MSSQL_USER=<DB_USER>
MSSQL_PASS=<DB_PASSWORD>
MSSQL_DB=<DB_NAME>
```

Run the app using following commands

```bash
cd mssql-node-sample
npm install 
node app.js
```

### Docker Installation

Make sure you have set `MSSQL_*` environment variables. 

Additionally, you also need to set `CONTEXT` environment variable which is the prefix to the name of the generated docker image.

Build a new docker image using

```bash
make container
```

Run the docker image locally using

```bash 
make run
```

Push the docker image to your registry using

```bash 
make push
```

### Usage

The app is launched at `localhost:3000`

Look under routes directory to know more about all the available routes and actions.

### License

This app is based on original work published by Microsoft in [this repo](https://github.com/microsoft/sql-server-samples)

See license.txt for more information.
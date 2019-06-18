all: container

container: 
	docker build -t ${CONTEXT}/mssql-node-app:latest .
push:
	docker push ${CONTEXT}/mssql-node-app:latest
run:
	docker run --name mssql-node-app -e MSSQL_PORT=${MSSQL_PORT} -e MSSQL_HOST=${MSSQL_HOST} -e MSSQL_USER=${MSSQL_USER} -e MSSQL_PASS=${MSSQL_PASS} -p 3000:3000 -d ${CONTEXT}/mssql-node-app:latest
     

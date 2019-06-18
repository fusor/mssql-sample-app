#!/bin/bash

sleep 90s

/opt/mssql-tools/bin/sqlcmd -S ${MSSQL_HOST},${MSSQL_PORT} -U ${MSSQL_USER} -P ${MSSQL_PASS} -d master -i setup/setup.sql


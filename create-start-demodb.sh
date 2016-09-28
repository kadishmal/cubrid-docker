#!/usr/bin/env bash

cd $CUBRID_DATABASES
mkdir demodb
cd demodb
cubrid createdb --db-volume-size=64M --log-volume-size=64M demodb en_US.utf8
cubrid loaddb -u dba -s $CUBRID/demo/demodb_schema -d $CUBRID/demo/demodb_objects demodb
# Auto start "demodb" database when the server is started.
# `-e` instructs not to escape special characters.
echo -e "[service]\nserver=demodb" >> $CUBRID/conf/cubrid.conf
# Start CUBRID service.
cubrid service start && tail -f $CUBRID_LOGS/**/* $CUBRID_LOGS/**/**/*

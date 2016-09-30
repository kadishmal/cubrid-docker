## What is CUBRID?

CUBRID (/ˈkjuːbrɪd/ "cube-rid") is an open source SQL-based relational database management system (RDBMS) with object extensions developed by NAVER Corporation for web applications.

- http://www.cubrid.org

## How to use this image

    docker run -p 33000:33000 --name cubrid lighthopper/cubrid:9.3.6.0002

The image has a default command:
 
    cubrid service start && tail -f $CUBRID_LOGS/**/* $CUBRID_LOGS/**/**/*

It will start CUBRID Service and tail all its logs. You may override this command
as follows:

    docker run -p 33000:33000 --name cubrid lighthopper/cubrid:9.3.6.0002 cubrid service start 

This, for instance, will start the Service but will not tail log files.

Another alternative command is to create and start the `demodb` database distributed
together with CUBRID.

    docker run -p 33000:33000 --name cubrid lighthopper/cubrid:9.3.6.0002 ./create-start-demodb.sh
    
Or in case CUBRID is already running in a `cubrid` container:

    docker exec cubrid ./create-start-demodb.sh

## Available versions

The following versions are available via tags.

- 9.3.6.0002
- 9.2.26.0004
- 9.2.3.0005
- 9.1.0.0218
- 9.0.0.0478
- 8.4.3.10001
- 8.4.1.32003

All these images are based on CentOS 6.6.

## How to build this image:

	docker build -t="lighthopper/cubrid:9.3.6.0002" .

The CUBRID binary will be retrieved on build from http://ftp.cubrid.org/CUBRID_Engine/.

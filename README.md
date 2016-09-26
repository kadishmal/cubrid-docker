## What is CUBRID?

CUBRID (/ˈkjuːbrɪd/ "cube-rid") is an open source SQL-based relational database management system (RDBMS) with object extensions developed by NAVER Corporation for web applications.

- http://www.cubrid.org

## How to use this image

	docker run -p 33000:33000 --name cubrid lighthopper/cubrid:9.2.3.0005

## Available versions

The following versions are available via tags.

- 9.2.3.0005

## How to build this image:

	docker build -t="lighthopper/cubrid:9.2.3.0005" .

The CUBRID binary will be retrieved on build from http://ftp.cubrid.org/CUBRID_Engine/.

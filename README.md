
English | [简体中文](README-CN.md)

# Build project code quickly

## Overview

* Building an API project
* Building an RPC project
* Connect the database to generate the corresponding 'Model'
* Run the CMD command hot

## Using The Example

> Creating an HTTP Service  

```sh
qb api -n demo -f src -p 8088  
```

* -n: Designation of Project
* -f: Save the path
* -p: Port

> Creating an RPC Service   

```sh
qb rpc -n demo -f src -p 8088  
```

* -n: Designation of Project
* -f: Save the path
* -p: Port


> Creating an Model 

```sh
qb model --tb table -f "account:password@tcp(host:port)/dbname" --fw gorm  -s savepath
```

* --tb: Specify the database name
* &nbsp;&nbsp;&nbsp;-f: Connecting to a Database
* --fw: Select generate frame as `GORM`
* &nbsp;&nbsp;&nbsp;-s: Save the path


> Run the CMD command hot

```sh
qb hot --cm "go build ./tmp/demo" --cm "./tmp/demo" -p "demo" -d 4000
```

* -c: Config path
* --cm: The CMD command can be multiple
* -p: The root directory
* -d: Time interval for each execution, in ms
* -t: When the number of triggering times reaches n, the command is forcibly executed again
* --icdr: Included directories regular expressions
* --ecdr: Encluded directories regular expressions
* --ifr: Includes file regular expressions. For example, ".go$" The suffix. Go file changed
* --efr: Exclude file regular expressions


## Go

Dockerfile
```sh
FROM wjojz/qb-hot:latest AS qb-hot

FROM golang:1.18

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]
```

build
```sh
docker build -t wjojz/qb-hot-go:latest .
```

run
```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 wjojz/qb-hot-go:latest  --cm "go run main.go"
```


## HTML

Dockerfile
```sh
FROM wjojz/qb-hot:latest AS qb-hot

FROM puppet/discocoreui

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]
```

build
```sh
docker build -t wjojz/qb-hot-html:latest .
```
run
```sh
docker run -it --rm -w "html/project" -v $(pwd):/html/project -p 9090:9090 wjojz/qb-hot-html:latest --cm "npm run build"
```

## PHP

Dockerfile
```sh
FROM wjojz/qb-hot:latest AS qb-hot

FROM php:7.4-cli

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]
```

build
```sh
docker build -t wjojz/qb-hot-php:latest .
```
run
```sh
docker run -it --rm -w "php/project" -v $(pwd):/php/project -p 9090:9090 wjojz/qb-hot-php:latest --cm "php hello.php"
```

Java

Dockerfile
```sh
FROM wjojz/qb-hot:latest AS qb-hot

FROM openjdk:11

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]
```

build
```sh
docker build -t wjojz/qb-hot-java:latest .
```

run
```sh
docker run -it --rm -w "java/project" -v $(pwd):/java/project -p 9090:9090 wjojz/qb-hot-java:latest --cm "java hello.java"
```

English | [简体中文](README-CN.md)

# Build project code quickly

## Overview

* Building an API project
* Building an RPC project
* Connect the database to generate the corresponding 'Model'
* Run the CMD command hot
* RPM packaging (Default binary packaging)
* Support swagger commands

## Using The Example


> RPM uses binary packaging

```sh
qb rpm -rs ./ -o ../pkg #Binary packaging
qb rpm -rs ./ -o ../pkg -starting -start /usr/bin/qb #Binary pack and set boot on
```

* -name: Package name
* -version: Version (Format: 1.0.0)
* -summary: Summary
* -vendor: Supplier
* -license: Signature
* -url: Access address
* -description: Description
* -changelog: Modify log
* -spec: Spec path (Source package must be used)
* -roots: The root directory to pack
* -way: Packaging mode (bin: binary packaging src: source packaging)
* -number: Number of releases
* -src: Whether to package source code
* -out: Save path after packaging
* -starting: Whether to set startup
* -start: Start up the running program
* -reload: The service restarts the running program

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
qb model --tb table -f "account:password@tcp(host:port)/dbname" --fw gorm  -s savepath --sw
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

Build

```sh
docker build -t wjojz/qb-hot-go:latest .
```

Run

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

Build

```sh
docker build -t wjojz/qb-hot-html:latest .
```

Run

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

Build

```sh
docker build -t wjojz/qb-hot-php:latest .
```

Run

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

Build

```sh
docker build -t wjojz/qb-hot-java:latest .
```

Run

```sh
docker run -it --rm -w "java/project" -v $(pwd):/java/project -p 9090:9090 wjojz/qb-hot-java:latest --cm "java hello.java"
```

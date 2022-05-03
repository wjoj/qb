
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

* --cm: The CMD command can be multiple
* &nbsp;&nbsp;&nbsp;-p: The root directory
* &nbsp;&nbsp;&nbsp;-d: Time interval for each execution, in ms

```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 feizhuji/qb-hot:latest
```
Or
```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 feizhuji/qb-hot:latest --cm "go run main.go"
```
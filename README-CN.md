
[English](README.md) | 简体中文

# 快速构建工程

## 概述

* 构建API项目
* 构建RPC项目
* 连接数据库生成对应的`Model`
* 热运行`CMD`命令

## 使用例子

> 创建一个`HTTP`服务

```sh
qb api -n demo -f src -p 8088  
```

* -n: 指定工程名称
* -f: 保存路径
* -p: 端口

> 创建一个`RPC`服务

```sh
qb rpc -n demo -f src -p 8088    
```

* -n: 指定工程名称
* -f: 保存路径
* -p: 端口

> 创建一个`Model`文件

```sh
qb model --tb table -f "account:password@tcp(host:port)/dbname" --fw gorm  -s savepath
```

* --tb: 指定数据库名称
* &nbsp;&nbsp;&nbsp;-f: 连接数据库
* --fw: 选择生成框架为`gorm`
* &nbsp;&nbsp;&nbsp;-s: 保持路径

> 热运行`CMD`命令

```sh
qb hot --cm "go build ./tmp/demo" --cm "./tmp/demo" -p "demo" -d 4000
```

* --cm: CMD命令，可以多条
* &nbsp;&nbsp;&nbsp;-p: 根目录
* &nbsp;&nbsp;&nbsp;-d: 每次执行的时间间隔，单位：ms

```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 feizhuji/qb-hot
```
或
```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 feizhuji/qb-hot --cm "go run main.go"
```

[English](README.md) | 简体中文

# 快速构建工程

## 概述

* 构建API项目
* 构建RPC项目
* 连接数据库生成对应的`Model`
* 热运行`CMD`命令
* rpm打包(默认二进制打包)

## 使用例子

> rpm使用二进制打包

```sh
qb rpm -rs ./ -o ../pkg #二进制打包
qb rpm -rs ./ -o ../pkg -starting -start /usr/bin/qb #二进制打包并设置开机启动
```

* -name: 包名
* -version: 版本(格式：1.0.0)
* -summary: 概要
* -vendor: 供应商
* -license: 签名
* -url: 访问地址
* -description: 描素
* -changelog: 修改日志
* -spec: spec路径(源码打包方式必须)
* -roots: 要打包的根目录
* -way: 打包方式(bin: 二进制打包 src: 源码打包)
* -number: 发布次数
* -src: 是否打包源码
* -out: 打包后的路径
* -starting: 是否设置开机启动
* -start: 开机启动运行的程序
* -reload: 服务重启运行的程序

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

* -c: 配置路径
* --cm: `CMD`命令可以为多个
* -p: 跟目录
* -d: 要执行时的时间间隔, 单位：ms
* -t: 当触发次数达到n次时，强制执行命令
* --icdr: 包含的目录正则表达式
* --ecdr: 排除的目录正则表达式
* --ifr: 包含文件正则表达式。例如,“.go$”后缀。只包含后缀名为`.go`文件改变
* --efr: 排除文件正则表达式

Go

```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 wjojz/qb-hot:latest
```

or

```sh
docker run -it --rm -w "/go/src/github.com/demo" -v $(pwd):/go/src/github.com/demo -p 9090:9090 wjojz/qb-hot:latest --cm "go run main.go"
```

HTML

```sh
docker run -it --rm -w "html/project" -v $(pwd):/html/project -p 9090:9090 wjojz/qb-hot:latest --cm "npm run build"
```

PHP

```sh
docker run -it --rm -w "php/project" -v $(pwd):/php/project -p 9090:9090 wjojz/qb-hot:latest --cm "php hello.php"
```

Java

```sh
docker run -it --rm -w "java/project" -v $(pwd):/java/project -p 9090:9090 wjojz/qb-hot:latest --cm "java hello.java"
```

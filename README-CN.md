
[English](README.md) | 简体中文

# 快速构建工程

## 使用例子

创建一个`HTTP`服务

```sh
qb api -n demo -f src -p 8088  
```

* -n: 指定工程名称
* -f: 保存路径
* -p: 端口

创建一个`RPC`服务

```sh
qb rpc -n demo -f src -p 8088    
```

* -n: 指定工程名称
* -f: 保存路径
* -p: 端口

创建一个`Model`文件

```sh
qb model --tb table -f "account:password@tcp(host:port)/dbname" --fw gorm  -s savepath
```

* --tb: 指定数据库名称
* &nbsp;&nbsp;&nbsp;-f: 连接数据库
* --fw: 选择生成框架为`gorm`
* &nbsp;&nbsp;&nbsp;-s: 保持路径
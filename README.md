
English | [简体中文](README-CN.md)

# Build project code quickly

## Using The Example

Creating an HTTP Service  

```sh
> qb api -n demo -f src -p 8088  
```

* -n: Designation of Project
* -f: Save the path
* -p: Port

Creating an RPC Service   

```sh
qb rpc -n demo -f src -p 8088  
```

* -n: Designation of Project
* -f: Save the path
* -p: Port


Creating an Model 

```sh
qb model --tb table -f "account:password@tcp(host:port)/dbname" --fw gorm  -s savepath
```

* --tb: Specify the database name
* &nbsp;&nbsp;&nbsp;-f: Connecting to a Database
* --fw: Select generate frame as `GORM`
* &nbsp;&nbsp;&nbsp;-s: Save the path
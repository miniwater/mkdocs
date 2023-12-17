# NodeJS

## 手动管理进程

### 项目启动

```Shell
npm start

node production.js
```

如果生产环境不想使用 PM2 来管理服务，那么可以手工通过脚本来管理，可以先在项目根目录下执行 `node production.js` 启动服务。

当访问服务没问题后，可以通过 `nohup node production.js &` 启动服务，通过 `nohup` 和 `&` 将服务在后台运行，执行后会看到类似下面的日志：

```Shell
nohup node production.js &
[2] 1114
appending output to nohup.out
```

看到输出后，回车，执行 `exit` 命令退出当前终端，这样服务就在后台运行了。

启动完成后，可以通过 `ps aux | grep node` 查看具体的 node 进程情况：

```text
welefen           3971   0.0  0.3  3106048  46244 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3970   0.0  0.3  3106048  46064 s001  S+   11:14AM   0:00.64 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3969   0.0  0.3  3106040  46248 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3968   0.0  0.3  3106048  46400 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3967   0.0  0.3  3106048  46608 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3966   0.0  0.3  3106048  46432 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3965   0.0  0.3  3106040  46828 s001  S+   11:14AM   0:00.65 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3964   0.0  0.3  3106048  46440 s001  S+   11:14AM   0:00.64 /usr/local/bin/node /Users/welefen/demo/production.js
welefen           3963   0.0  0.2  3135796  40960 s001  S+   11:14AM   0:00.31 node production.js
```

其中前面几个为 fork 出来的子进程，最后一个为主进程。

### 重启服务

当代码修改后，需要重启服务，最简单的办法就是找到主进程的 pid，然后通过 `kill -9 PID` 杀死进程然后重新启动。如果不想中断服务，那么可以给主进程发送 `SIGUSR2` 信号来完成：

```
kill -s USR2 PID
```

比如上面打印出来的日志中主进程的 pid 为 3963，那么可以通过 `kill -s USR2 3963` 来无中断重启服务。当然每次这么执行比较麻烦，可以包装成一个简单的脚本来执行。

```sh
#!/bin/sh
cd PROJECT_PATH; # 进入项目根目录
nodepid=`ps auxww | grep node | grep production.js | grep -v grep | awk '{print $2}' `
if [ -z "$nodepid" ]; then
    echo 'node service is not running'
    nohup node production.js > ~/file.log 2>&1 & 
else
    echo 'node service is running'
    kill -s USR2 $nodepid 2>/dev/null
    echo 'gracefull restart'
fi
```

## PM2

PM2 是一款专业管理 Node.js 服务的模块，建议在线上使用。

### 安装

使用 PM2 需要以全局的方式安装，如：

```shell
sudo npm install -g pm2
```

安装完成后，命令行下会有 `pm2` 命令。

创建项目时，会在项目目录下创建名为 `pm2.json` 的配置文件，内容类似如下：

```json
{
  "apps": [{
    "name": "demo",
    "script": "production.js",
    "cwd": "/Users/welefen/Develop/git/thinkjs/demo",
    "max_memory_restart": "1G",
    "autorestart": true,
    "node_args": [],
    "args": [],
    "env": {}
  }]
}
```

将 `name` 字段改为项目名，`cwd` 字段改为线上项目的具体路径。

### 项目启动

可以在项目根目录下执行 `pm2 start pm2.json` 来启动项目

### 项目重启

由于 Node.js 是自身启动服务运行的，所以当有代码更新后，需要重启服务才能让其生效。

最简单的办法可以通过 `pm2 restart pm2.json` 重启服务，但这种方式会导致服务临时性的中断（重启服务需要时间，重启过程中会导致无法处理用户的请求从而导致服务中断）。如果不想服务中断，那么可以通过发送信号的方式来重启方式，具体命令为：

```
pm2 sendSignal SIGUSR2 pm2.json
```

通过发送 `SIGUSR2` 信号，pm2 会将这个信号派发给框架，框架主进程捕获到这个信号后，会 fork 一个新的子进程提供服务，然后逐渐将之前的子进程重启，从而达到不中断服务重启的目的。

### 常用命令

`pm2 --help`

#### 查看列表

```Shell
pm2 l
```

#### 查看详情

`pm2 show app_name|app_id`或者`pm2 describe app_name|app_id`

```Shell
pm2 show 21
```

#### 重启

```Shell
pm2 restart app.js

pm2 restart app_name|app_name

pm2 restart 21
```

#### 停止

停止特定的应用。可以先通过`pm2 list`获取应用的名字（--name指定的）或者进程id。

```Shell
pm2 stop app_name|app_id
```

停止所有应用

```Shell
pm2 stop all
```

#### 删除

类似`pm2 stop`

```Shell
pm2 delete app_name|app_id
pm2 delete all
```

#### 负载均衡

命令如下，表示开启三个进程。如果`-i 0`，则会根据机器当前核数自动开启尽可能多的进程。

```Shell
pm2 start app.js -i 3 # 开启三个进程
pm2 start app.js -i max # 根据机器CPU核数，开启对应数目的进程
```

#### 日志查看

除了可以打开日志文件查看日志外，还可以通过`pm2 logs`来查看实时日志。

查看指定应用程序日志：

```Shell
pm2 logs app_name|app_id
```

例如：

```Shell
pm2 logs 21
```

显示所有应用程序的日志：

```Shell
pm2 logs
```

另外PM2提供了十分强大的[日志管理](https://link.juejin.cn/?target=http%3A%2F%2Fpm2.keymetrics.io%2Fdocs%2Fusage%2Flog-management%2F%23log-management "http://pm2.keymetrics.io/docs/usage/log-management/#log-management")功能，支持以多种方式查看日志。

##### 以特殊日期格式查看日志

```Shell
pm2 logs server --format
```

结果如下：

```Shell
timestamp=2019-04-10-23:13:25+0800 app=server id=0 type=out message=dev 
timestamp=2019-04-10-23:13:26+0800 app=server id=0 type=out message=Server started at 8080
```

##### 以JSON格式查看日志

```Shell
pm2 logs server --json
```

结果如下：

```json
{"timestamp":"2019-04-10T15:14:52.376Z","type":"process_event","status":"exit","app_name":"server"}
{"timestamp":"2019-04-10T15:14:52.479Z","type":"process_event","status":"exit","app_name":"server"}
{"message":"dev","timestamp":"2019-04-10T15:14:53.246Z""type":"out","process_id":0,"app_name":"server"}
{"timestamp":"2019-04-10T15:14:53.284Z","type":"process_event","status":"online","app_name":"server"}
{"message":"Server started at 8080","timestamp":"2019-04-10T15:14:53.474Z","type":"out","process_id":0"app_name":"server"}
```

##### 查看近3行日志

```Shell
pm2 logs server --lines --raw  
```

例如：  

```Shell
pm2 logs server --lines 3
```

结果如下：

```Shell
[TAILING] Tailing last 3 lines for [server] process (change the value with --lines option)
C:\xxx\.pm2\logs\server-error.log last 3 lines:
0|server   |   code: 'ETIMEDOUT',
0|server   |   syscall: 'connect',
0|server   |   fatal: true }

C:\xxx\.pm2\logs\server-out.log last 3 lines: 
0|server   | Server started at 8080
0|server   | dev
0|server   | Server started at 8080
```

## Docker

越来越多的业务使用容器服务来部署项目了，ThinkJS 项目要使用容器部署也非常简单。首先我们要创建业务镜像，以下是一个简单的 Dockerfile 文件，包括基础镜像，依赖安装，项目文件拷贝和项目启动四个部分。

```Dockerfile
FROM mhart/alpine-node:8.9.4

WORKDIR /animaris
COPY package.json /animaris/package.json
RUN npm i --production --registry=https://registry.npm.taobao.org

COPY src /animaris/src
COPY view /animaris/view
COPY www /animaris/www
COPY production.js /animaris/production.js

ENV DOCKER=true
EXPOSE 8360
CMD [ "node", "/animaris/production.js" ]
```

创建好构建脚本后使用如下命令进行构建：

```sh
docker build -t lizheming/animaris ./Dockerfile
```

之后使用如下命令运行镜像，即可使用 [http://localhost:8360](http://localhost:8360/) 访问网站：

```sh
docker run -p 8360:8360 lizheming/animaris
```

关于更多 Docker 部署 ThinkJS 相关内容可查看[《ThinkJS 项目构建 Docker 镜像 》](https://zhuanlan.zhihu.com/p/37082611)。
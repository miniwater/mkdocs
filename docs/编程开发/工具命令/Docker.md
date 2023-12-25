# Docker

image：镜像
volume：卷

windows

i5 13600k慢吞吞版:`docker run -d -v E:/project/docker/ollama:/root/.ollama -p 11434:11434 --name ollama_CPU ollama/ollama`

rtx3060ti急速版(爆显存):`docker run -d --gpus=all -v E:/project/docker/ollama:/root/.ollama -p 11434:11434 --name ollama_GPU ollama/ollama`

启动       sudo systemctl start docker
守护进程重启   sudo systemctl daemon-reload
重启docker服务  sudo systemctl restart  docker
重启docker服务  sudo service docker restart
关闭docker  sudo service docker stop
关闭docker  sudo systemctl stop docker

* 服务启动
```service docker start```

* 服务停止
```service docker stop```

* 本地容器列表
```docker images```

* 列出volume
```docker volume ls```

* 列出所有在运行的容器信息
```docker ps [OPTIONS]```
  * -a :显示所有的容器，包括未运行的。
  * -f :根据条件过滤显示的内容。
  * --format :指定返回值的模板文件。
  * -l :显示最近创建的容器。
  * -n :列出最近创建的n个容器。
  * --no-trunc :不截断输出。
  * -q :静默模式，只显示容器编号。
  * -s :显示总的文件大小。

* 容器内部打开终端
```docker exec -i -t  [NAMES] /bin/bash```
退出终端
```exit```

[详细介绍](<https://www.runoob.com/docker/docker-command-manual.html>

docker run的退出状态码：

状态码|含义
---|---
0 |表示正常退出
非0 |表示异常退出（退出状态码采用chroot标准）
125 |Docker守护进程本身的错误
126 |容器启动后，要执行的默认命令无法调用
127 |容器启动后，要执行的默认命令不存在
其他命令 |容器启动后正常执行命令，退出命令时该命令的返回状态码作为容器的退出状态码

## run指令列表

https://docs.docker.com/engine/reference/commandline/run/

| 名称，速记                   | 违约      | 描述                                                                                                                                                          |
|-------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| --add-host              |         | 添加自定义主机到 IP 的映射（主机：ip）                                                                                                                                      |
| --attach,-a             |         | 附加到 STDIN、STDOUT 或 STDERR                                                                                                                                   |
| --blkio-weight          |         | 块 IO（相对权重），介于 10 和 1000 之间，或 0 禁用（默认为 0）                                                                                                                    |
| --blkio-weight-device   |         | 块 IO 重量（相对设备重量）                                                                                                                                             |
| --cap-add               |         | 添加 Linux 功能                                                                                                                                                 |
| --cap-drop              |         | 放弃 Linux 功能                                                                                                                                                 |
| --cgroup-parent         |         | 容器的可选父 cgroup                                                                                                                                               |
| --cgroupns              |         | API 1.41+要使用的 Cgroup 命名空间（主机|private）“host”：在 Docker 主机的 cgroup 命名空间“private”中运行容器：在其自己的私有 cgroup 命名空间 ''中运行容器：使用由守护程序上的默认 cgroupns 模式选项配置的 cgroup 命名空间（默认） |
| --cidfile               |         | 将容器 ID 写入文件                                                                                                                                                 |
| --cpu-count             |         | CPU 计数（仅限 Windows）                                                                                                                                          |
| --cpu-percent           |         | CPU 百分比（仅限 Windows）                                                                                                                                         |
| --cpu-period            |         | 限制 CPU CFS（完全公平的调度程序）周期                                                                                                                                     |
| --cpu-quota             |         | 限制 CPU CFS（完全公平的调度程序）配额                                                                                                                                     |
| --cpu-rt-period         |         | 以微秒为单位限制 CPU 实时周期                                                                                                                                           |
| --cpu-rt-runtime        |         | 以微秒为单位限制 CPU 实时运行时间                                                                                                                                         |
| --cpu-shares,-c         |         | CPU 份额（相对权重）                                                                                                                                                |
| --cpus                  |         | 处理器数量                                                                                                                                                       |
| --cpuset-cpus           |         | 允许执行的 CPU （0-3， 0，1）                                                                                                                                        |
| --cpuset-mems           |         | 允许执行的 MEM （0-3， 0，1）                                                                                                                                        |
| --detach,-d             |         | 在后台运行容器并打印容器 ID                                                                                                                                             |
| --detach-keys           |         | 覆盖用于分离容器的键序列                                                                                                                                                |
| --device                |         | 将主机设备添加到容器                                                                                                                                                  |
| --device-cgroup-rule    |         | 将规则添加到 cgroup 允许的设备列表                                                                                                                                       |
| --device-read-bps       |         | 限制从设备读取速率（每秒字节数）                                                                                                                                            |
| --device-read-iops      |         | 限制设备的读取速率（IO/秒）                                                                                                                                             |
| --device-write-bps      |         | 限制对设备的写入速率（每秒字节数）                                                                                                                                           |
| --device-write-iops     |         | 限制对设备的写入速率（每秒 IO）                                                                                                                                           |
| --disable-content-trust | true    | 跳过图像验证                                                                                                                                                      |
| --dns                   |         | 设置自定义 DNS 服务器                                                                                                                                               |
| --dns-opt               |         | 设置域名解析选项                                                                                                                                                    |
| --dns-option            |         | 设置域名解析选项                                                                                                                                                    |
| --dns-search            |         | 设置自定义 DNS 搜索域                                                                                                                                               |
| --domainname            |         | 容器 NIS 域名                                                                                                                                                   |
| --entrypoint            |         | 覆盖图像的默认入口点                                                                                                                                                  |
| --env,-e                |         | 设置环境变量                                                                                                                                                      |
| --env-file              |         | 读取环境变量文件                                                                                                                                                    |
| --expose                |         | 公开一个端口或一系列端口                                                                                                                                                |
| --gpus                  |         | API 1.40+要添加到容器的 GPU 设备（“全部”以传递所有 GPU）                                                                                                                      |
| --group-add             |         | 添加其他组以加入                                                                                                                                                    |
| --health-cmd            |         | 运行以检查运行状况的命令                                                                                                                                                |
| --health-interval       |         | 运行检查之间的时间（毫秒||m|h）（默认为 0s）                                                                                                                                  |
| --health-retries        |         | 需要连续故障来报告不正常                                                                                                                                                |
| --health-start-period   |         | 容器在启动运行状况重试倒计时之前要初始化的开始周期 （ms\|s\|m\|h） （默认值 0s）                                                                                                               |
| --health-timeout        |         | 允许运行一个检查的最长时间（毫秒||m|h）（默认为 0 秒）                                                                                                                             |
| --help                  |         | 打印用法                                                                                                                                                        |
| --hostname,-h           |         | 容器主机名                                                                                                                                                       |
| --init                  |         | 在容器内运行一个 init，用于转发信号并收获进程                                                                                                                                   |
| --interactive,-i        |         | 即使未连接，也要保持 STDIN 打开                                                                                                                                         |
| --io-maxbandwidth       |         | 系统驱动器的最大 IO 带宽限制（仅限 Windows）                                                                                                                                |
| --io-maxiops            |         | 系统驱动器的最大 IOps 限制（仅限 Windows）                                                                                                                                |
| --ip                    |         | IPv4 地址（例如，172.30.100.104）                                                                                                                                  |
| --ip6                   |         | IPv6 地址（例如，2001：db8：：33）                                                                                                                                    |
| --ipc                   |         | 要使用的 IPC 模式                                                                                                                                                 |
| --isolation             |         | 容器隔离技术                                                                                                                                                      |
| --kernel-memory         |         | 内核内存限制                                                                                                                                                      |
| --label,-l              |         | 在容器上设置元数据                                                                                                                                                   |
| --label-file            |         | 读取以行分隔的标签文件                                                                                                                                                 |
| --link                  |         | 添加指向其他容器的链接                                                                                                                                                 |
| --link-local-ip         |         | 容器 IPv4/IPv6 链路本地地址                                                                                                                                         |
| --log-driver            |         | 容器的日志记录驱动程序                                                                                                                                                 |
| --log-opt               |         | 日志驱动程序选项                                                                                                                                                    |
| --mac-address           |         | 容器 MAC 地址（例如，92：d0：c6：0a：29：33）                                                                                                                             |
| --memory,-m             |         | 内存限制                                                                                                                                                        |
| --memory-reservation    |         | 内存软限制                                                                                                                                                       |
| --memory-swap           |         | 交换限制等于内存加交换：“-1”以启用无限制交换                                                                                                                                    |
| --memory-swappiness     | -1      | 调整容器内存交换（0 到 100）                                                                                                                                           |
| --mount                 |         | 将文件系统挂载附加到容器                                                                                                                                                |
| --name                  |         | 为容器分配名称                                                                                                                                                     |
| --net                   |         | 将容器连接到网络                                                                                                                                                    |
| --net-alias             |         | 为容器添加网络范围的别名                                                                                                                                                |
| --network               |         | 将容器连接到网络                                                                                                                                                    |
| --network-alias         |         | 为容器添加网络范围的别名                                                                                                                                                |
| --no-healthcheck        |         | 禁用任何容器指定的运行状况检查                                                                                                                                             |
| --oom-kill-disable      |         | 禁用 OOM 杀手                                                                                                                                                   |
| --oom-score-adj         |         | 调整主机的 OOM 首选项（-1000 到 1000）                                                                                                                                 |
| --pid                   |         | 要使用的 PID 命名空间                                                                                                                                               |
| --pids-limit            |         | 调整容器 pid 限制（设置为 -1 无限制）                                                                                                                                     |
| --platform              |         | 如果服务器支持多平台，则设置平台                                                                                                                                            |
| --privileged            |         | 为此容器授予扩展权限                                                                                                                                                  |
| --publish,-p            |         | 将容器的端口发布到主机                                                                                                                                                 |
| --publish-all,-P        |         | 将所有公开的端口发布到随机端口                                                                                                                                             |
| --pull                  | missing | 运行前拉取图像（“始终”\|”缺少“\|”从不“）                                                                                                                                     |
| --read-only             |         | 以只读方式挂载容器的根文件系统                                                                                                                                             |
| --restart               | no      | 要在容器退出时应用的重新启动策略                                                                                                                                            |
| --rm                    |         | 容器退出时自动移除                                                                                                                                                   |
| --runtime               |         | 用于此容器的运行时                                                                                                                                                   |
| --security-opt          |         | 安全选项                                                                                                                                                        |
| --shm-size              |         | /dev/shm 的大小                                                                                                                                                |
| --sig-proxy             | true    | 代理接收到进程的信号                                                                                                                                                  |
| --stop-signal           | SIGTERM | 停止容器的信号                                                                                                                                                     |
| --stop-timeout          |         | 超时（以秒为单位）以停止容器                                                                                                                                              |
| --storage-opt           |         | 容器的存储驱动程序选项                                                                                                                                                 |
| --sysctl                |         | 系统选项                                                                                                                                                        |
| --tmpfs                 |         | 挂载 tmpfs 目录                                                                                                                                                 |
| --tty,-t                |         | 分配伪 TTY                                                                                                                                                     |
| --ulimit                |         | 乌利米特选项                                                                                                                                                      |
| --user,-u               |         | 用户名或 UID （格式：&lt;名称|uid&gt;[：&lt;group|gid&gt;]）                                                                                                            |
| --userns                |         | 要使用的用户命名空间                                                                                                                                                  |
| --uts                   |         | 要使用的 UTS 命名空间                                                                                                                                               |
| --volume,-v             |         | 绑定装入卷                                                                                                                                                       |
| --volume-driver         |         | 容器的可选卷驱动程序                                                                                                                                                  |
| --volumes-from          |         | 从指定的容器装入卷                                                                                                                                                   |
| --workdir,-w            |         | 容器内的工作目录                                                                                                                                                    |



--rm 退出容器时会自动将其删除



## docker-compose

* 运行
```docker-compose up```

* 运行并挂起
```docker-compose up -d```

* 停止
```docker-compose down```

* 删除容器
先删除container（images运行时的的状态）
可以使用命令docker ps来查看正在运行的container，对于已经退出的container，则可以使用docker ps -a来查看

```shell
docker ps -a
docker rm 117843ade696
```

删除容器

```shell
docker images
docker rmi 117843ade696
```

更新容器

```shell
docker-compose pull
docker-compose up -d
```

>使用docker-compose up -d以分离模式启动所有服务(-d)(在分离模式下不会看到任何日志)
>使用docker-compose logs -f -t将自己附加到所有正在运行的服务的日志中,而-f表示您遵循日志输出,而-t选项为您提供时间戳(请参阅Docker reference)
>使用Ctrl z或Ctrl c将自己与日志输出分离,而不关闭正在运行的容器

### Yaml 配置

```dockerfile
version: '3'
services:
  服务名称:
    image: */*:latest
    restart: no
    container_name: 名字
    
    volumes:
      - ./yaml同级文件夹/:/data/
      
    ports:
      - "5799:80"
      
    # environment: # 环境
    #   - WEBSOCKET_ENABLED=true
    
    # privileged: true # root权限
    
    # no 容器退出时，不自动重启容器。这是默认值
    # on-failure[:max-retries] 当容器以非零状态码(正常退出时状态码为0)退出时，重新启动。max-retries为最大重试次数(可选)，限制Docker守护程序尝试的重新启动重试次数。如不指定最大重试次数，默认为不断重试。
    # always 无论退出状态如何，始终重新启动容器
    # unless-stopped 无论退出状态如何，重新启动容器。如果容器在Docker守护程序停止之前已经处于停止状态，那么守护程序启动时，容器不会重新启动
    # restart: unless-stopped 
```

#### restart

> Docker容器的重启都是由Docker守护进程完成的，因此与守护进程息息相关。

* no 容器退出时，不自动重启容器。这是默认值
* on-failure[:max-retries] 当容器以非零状态码(正常退出时状态码为0)退出时，重新启动。max-retries为最大重试次数(可选)，限制Docker守护程序尝试的重新启动重试次数。如不指定最大重试次数，默认为不断重试。
    on-failure:3，在容器非正常退出时重启容器，最多重启3次
* always 无论退出状态如何，始终重新启动容器
* unless-stopped 无论退出状态如何，重新启动容器。如果容器在Docker守护程序停止之前已经处于停止状态，那么守护程序启动时，容器不会重新启动

#### network_mode

```dockerfile
network_mode: "bridge"
network_mode: "none"
network_mode: "host"
```

#### extra_hosts

主机名映射列表，会在 /etc/hosts文件中添加一些记录。

```dockerfile
extra_hosts:
 - "rkproblem:127.0.0.1"
 - "oauth:172.16.32.12"
```

#### volumes

可选的参数|含义
-|-
:ro|只读
:rw|可读可写

> 挂载一个目录或者一个已经存在的数据卷容器，可以直接使用`HOST:CONTAINER`这样的格式，或者使用`HOST:CONTAINER:ro`这样的格式，或者对于容器来说，数据卷是只读的，这样可以有效保护宿主机的文件系统。
compose的数据卷指定路径可以是相对路径，使用 . 或者 … 来指定性对目录

```本地路径:容器内部路径```

```dockerfile
# 只是指定一个路径，Docker 会自动在创建一个数据卷（这个路径是容器内部的）。
- /var/lib/mysql

# 使用绝对路径挂载数据卷
- /opt/data:/var/lib/mysql

# 以 Compose 配置文件为中心的相对路径作为数据卷挂载到容器。
- ./cache:/tmp/cache

# 使用用户的相对路径（~/ 表示的目录是 /home/<用户目录>/ 或者 /root/）
- ~/configs:/etc/configs/:ro

# 已经存在的命名的数据卷。
- datavolume:/var/lib/mysql
```

挂载容器路径

```dockerfile
version: "3.2"

services:
 jenkins:
  image: jenkins/jenkins:lts
  ports:
   - "8080:8080"
   - "50000:50000"
  volumes:
   - "jenkins_home:/var/jenkins_home"
volumes:
 jenkins_home:
```

查看容器重启次数
docker inspect -f "{{ .RestartCount }}" ba-208
查看容器最后一次的启动时间
docker inspect -f "{{ .State.StartedAt }}" ba-208

-e 容器环境

```shell
# docker volume create edc-nginx-vol // 创建一个自定义容器卷
# docker volume ls // 查看所有容器卷
# docker volume inspect edc-nginx-vol // 查看指定容器卷详情信息
```

## Dockerfile

```dockerfile
FROM   basse镜像

MAINTAINER    镜像作者

COPY    复制当前目录文件到镜像
COPY    src dest
COPY    ["src","dest"]

ADD   一样，复制并自动解压(tar,zip,tgz,xz)

EXPOSE    监听端口

WORKDIR  设置工作目录

VOLUME    存储

RUN   在容器中运行的命令

CMD 容器启动时的命令
```

## docker swarm

Docker公司推出的用来管理docker集群的平台，swarm偏重的是容器的部署,而k8s偏重于应用的部署。

项目位置 <https://github.com/docker/swarm>

貌似不维护了

## AZURE ACI (Azure Container Instance)

微软完全托管的容器服务。云服务

## k8s (Kubernetes)

建议使用Portainer管理

master <https://docs.portainer.io/start/install/server/docker>

node <https://docs.portainer.io/start/install/agent/docker>

容器管理： <https://github.com/portainer/portainer>
jupyter： <https://jupyter-docker-stacks.readthe>...
文档站： <http://mrdoc.zmister.com/project-7/do>...
vscode网页版： <https://github.com/cdr/code-server>
在线画图： <https://github.com/jgraph/drawio>
开源git： <https://docs.gitea.io/zh-cn/install-w>...
接口调试： <https://github.com/hoppscotch/hoppscotch>
爬虫调度框架： <https://github.com/crawlab-team/crawlab>
性能监控： <https://hub.docker.com/r/netdata/netdata>
可道云： <https://kodcloud.com/download/>
jetbrain全家桶： <https://github.com/JetBrains/projecto>...
镜像管理：<https://hub.docker.com/_/registry>
镜像管理web端： <https://hub.docker.com/r/konradkleine>...
网站导航： <https://hub.docker.com/r/arvon2014/we>...
为知笔记： <https://www.wiz.cn/zh-cn/docker>
nextcloud： <https://nextcloud.com/install/#instru>...
密码管理： <https://github.com/bitwarden>
webSSH工具： <https://github.com/nirui/sshwifty>
图床： <https://github.com/chevereto/Cheveret>...
下载工具： <https://github.com/P3TERX/Aria2-Pro-D>...
视频播放器：<https://jellyfin.org/>
电子书阅读： <https://github.com/troyeguo/koodo-reader>
alist
Baidunetdisk
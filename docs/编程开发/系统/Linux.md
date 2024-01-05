# Linux

--------

## 常用命令

更新软件列表：`apt-get update`

更新软件：`apt-get upgrade`

重启：`reboot`

关机：`shutdown  -h now`

清理shell：`clear` 或 <kbd>Ctrl</kbd>+<kbd>L</kbd>

## 软件更新与安装

| 说明   |命令   |
| ----------- | ----------- |
| 更新软件列表 | ```apt-get update``` |
| 更新软件 | ```apt-get upgrade``` |
| 搜索软件 | ```apt search *``` |
| 卸载软件 | ```apt autoremove *```
| 搜索软件列表 | ```apt list *java*```

### 编译安装

* 查看编译信息

    ```shell
    ./configure --help | more
    ```

* 编译

    ```shell
    ./configure --prefix=/opt/xxx 
    ```

* 安装

    ```shell
    make && make install
    ```

## 文件

查看路径：`pwd`

从当前目录下到家目录 cd 或者 cd ~

|     说明    |     命令    |
| ----------- | ----------- |
|创建目录 | mkdir |
|进入目录     |cd folder|
|返回上一级   |cd ..|
|返回用户目录   |cd|
|查找当前目录下文件     |find -name node|
|查找文件夹     |whereis node|
|当前目录文件列表 | ls -l|
|当前目录文件详细列表 | ls -sarln|
|文件详细 | file package.xml|
|复制 | cp|
|剪切(重命名) | mv|
|快捷键 | ln|

### 文件查看与操作

|     说明    |     命令    |
| ----------- | ----------- |
|查阅正在改变的日志文件 | tail -f a.log |
|顺序查阅文件 | cat |
|倒序查阅文件 | tac |

#### tail

```shell
# tail 命令不带任何参数，显示文件的最后 10 行。
tail abc.log

# 显示文件的最后 5 行
tail -n 5 abc.log

# 显示来自多个文件的最后 5 行
tail -n 5 abc.log cba.log

# 输出保存到新文本文件
tail -n 5 abc.log > output.txt

# 输出 追加 到旧文本文件。
tail -n 5 abc.log >> output.txt

# 实时监视
tail -f abc.log

# 实时监视，并保持重试，即该文件被删除或改名后，如果再次创建相同的文件名，会继续追踪
tail -F abc.log

# 从文件打印 400字节 4k 4M 数据
tail -c 400 abc.log
tail -c 4k abc.log
tail -c 4M abc.log

# -v 显示文件头标记   -q 隐藏多文件时的头标记
tail --help
man tail
```

#### cat

```shell
# 创建空白文件，运行后才是键入内容
cat > abc.txt

# 将文本附加到文件，不存在则自动新建
cat >> abc.txt

# 复制文件
cat  abc.txt > cba.txt

# 将多个文件的内容按顺序附加到一个文件中
cat abc.txt cba.txt > aaa.txt

# 查看带行尾的文件内容
cat -E abc.txt 

# 显示所有txt文件内容
cat *.txt

# 显示行号
cat -n abc.txt 

# 显示制表符 tab出来的空格
cat -T abc.txt

# 以可滚动和可搜索的方式使用键查看文件的内容
# more命令和less命令相似，但没有less命令强大
# 空格键       下一页
# b键          上一页
# 回车/向下键   下一行
# y/向上键      上一行
# d键          下半页
# u键          上半页
# q键           退出
cat abc.txt | less

# 以二进制格式显示文件内容
cat abc.txt | xxd -b

# 以十六进制格式显示文件内容
cat abc.txt | hexdump -C

# 显示文件的特定行
cat abc.txt | sed -n '3,6p'

# 不显示特殊字符
cat -v abc.txt

# 按字母顺序对文件内容进行排序
cat abc.txt | sort

# 在文件中显示文件结束标记(在输入EOF自动结束输入)
cat > abc.txt << EOF

# 倒序显示文件内容
tac abc.txt 

cat --help
man cat
```

### 文件目录

按字母排序

```
/:.
├─bin
├─boot
├─dev
├─etc
├─home
├─lib
├─lib32
├─lib64
├─libx32
├─lost+found
├─media
├─mnt
├─opt
├─proc
├─root
├─run
├─sbin
├─srv
├─sys
├─tmp
├─usr
├─var
└─...
```

<!-- ```
│  ├─css
│  │  └─extended
│  └─js
``` -->

#### 目录结构

linux一切皆文件

* bin
  > Binary(二进制)，存放系统的基本指令。如:cat、chmod、chown、cp、date、find、gzip、kill、ln、ls、mount、mv、ping、pwd、rm、su、tar、vi等，某些系统会软链接到usr/bin。
* boot
  > 用于启动操作系统的文件
* dev
  > 在Linux下面，设备也是一个文件，比如磁盘、优盘或者光盘等。包括无线网卡、摄像头和串口等都是一个文件。而通常这些文件都是在/dev目录下面，大家可以切换到该目录下看看具体的内容。
    * console
      > 系统控制台，也就是直接和系统连接的监视器。
    * cua
      > 计算机串行接口，与调制解调器一起使用的设备。
    * fd
      > 软驱设备驱动程序。如：/dev/fd0指系统的第一个软盘，也就是通常所说的a：盘，/dev/fd1指第二个软盘，. . . . . .而/dev/fd1h1440则表示访问驱动器1中的4 . 5高密盘。
    * hd
      > ide硬盘驱动程序接口。如：/dev/hda指的是第一个硬盘，had1则是指/dev/hda的第一个分区。如系统中有其他的硬盘，则依次为/dev/hdb、/dev/hdc、. . . . ..；如有多个分区则依次为hda1、hda2 . . . . . .
    * null
      > “黑洞”，所有写入该设备的信息都将消失。例如：当想要将屏幕上的输出信息隐藏起来时，只要将输出信息输入到/dev/null中即可。
    * pty
      > 提供远程登陆伪终端支持。在进行telnet登录时就要用到/dev/pty设备。
    * sd
      > scsi磁盘驱动程序接口。如有系统有scsi硬盘，就不会访问/dev/had，而会访问/ dev/sda。
    * st
      > scsi磁带驱动器驱动程序。
    * tty
      > 提供虚拟控制台支持。如：/dev/tty1指的是系统的第一个虚拟控制台，/dev/tty2则是系统的第二个虚拟控制台。
    * ttys
      > 计算机串行接口，对于dos来说就是“ com1”口。
* etc
  > 操作系统和应用程序的配置文件通常都统一存储在一个目录下面，这个目录就是/etc。很多配置文件都已文本文件的形式存储在这里。我们可以通过文本编辑器修改配置项。比如网络的IP地址、Nginx的配置和系统日志的配置等等都可以在这里找到。
    * fstab
      > 指定启动时需要自动安装的文件系统列表。也包括用swapon -a启用的swap区的信息。
    * group
      > 类似/etc/passwd ，但说明的不是用户信息而是组的信息。包括组的各种数据。
    * hostname
      > 主机名配置文件。
    * hosts
      > 本地域名解析文件。127.0.0.1 localhost。
    * init.d
      > 存放系统启动脚本。
    * issue
      > 包括用户在登录提示符前的输出信息。通常包括系统的一段短说明或欢迎信息。
    * login.defs
      > login命令的配置文件。
    * magic
      > file”的配置文件。包含不同文件格式的说明，“file”基于它猜测文件类型。
    * motd
      > message of the day，用户成功登录后自动输出。常用于通告信息，如计划关机时间的警告等。
    * mtab
      > 当前安装的文件系统列表。由脚本( scritp )初始化，并由mount 命令自动更新。当需要一个当前安装的文件系统的列表时使用(例如df 命令)。
    * passwd
      > 用户数据库，其中的域给出了用户名、真实姓名、用户起始目录、加密口令和用户的其他信息。
    * printcap
      > 类似/etc/termcap ，但针对打印机。语法不同。
    * profile
      > 全局环境变量，而用户变量在用户目录下而的`.bashrc`文件。立即生效：`source /etc/profile`。
    * resolv.conf
      > DNS服务器配置
    * securetty
      > 确认安全终端，即哪个终端允许超级用户( root )登录。一般只列出虚拟控制台，这样就不可能(至少很困难)通过调制解调器(modem)或网络闯入系统并得到超级用户特权。
    * shadow
      > 在安装了影子(shadow )口令软件的系统上的影子口令文件。影子口令文件将/etc/passwd文件中的加密口令移动到/ etc/shadow中，而后者只对超级用户( root)可读。这使破译口令更困难，以此增加系统的安全性。
    * shells
      > 列出可以使用的shell。chsh 命令允许用户在本文件指定范围内改变登录的shell。提供一台机器ftp服务的服务进程ftpd 检查用户shell是否列在/etc/shells 文件中，如果不是，将不允许该用户登录。
    * sysctl.conf
      > 配置一些系统信息，对应/proc/sys/这个目录的子目录及文件。修改后使用`sysctl -p`更新配置。
    * termcap
      > 终端性能数据库。说明不同的终端用什么“转义序列”控制。写程序时不直接输出转义序列(这样只能工作于特定品牌的终端)，而是从/etc/termcap 中查找要做的工作的正确序列。这样，多数的程序可以在多数终端上运行。
* home
  > 主目录。每个用户都有一个自己的目录，该目录就在/home下面。
* lib
* lib32
* lib64
* libx32
* lost+found
  > 每一个文件系统都有一个lost+found目录。如果文件系统崩溃，在系统下次启动的时候会进行数据检查。在检查的过程中如果发现有数据冲突的文件就会将其放入该目录中。这样，你就可以试着手动恢复该文件。
* media
  > 在目录/media下面包含的子目录是一些可插拔设备的挂载点。当一些可插拔设备插入电脑时，在该目录下会自动创建子目录，并进行挂载。
* mnt
  > 该目录通常是空的。主要用于临时挂载一些外部文件系统。比如有多个数据磁盘的情况下，会将格式化的磁盘挂载到该目录下面。mnt字符是mount的缩写，也就是挂载的意思。
* opt
  > 自行安装的非常规软件通常会安装在该目录。
* proc
  > 该目录也是一个虚拟目录，也就是并不是存储文件数据的目录。这个目录中存储的文件通常是用来获取操作系统内核内部信息或者进程内部信息的。
    * cpuinfo
      > 存放处理器( cpu)的信息，如cpu的类型、制造商、型号和性能等。
    * devices
      > 当前运行的核心配置的设备驱动的列表。
    * dma
      > 显示当前使用的dma通道。
    * filesystems
      > 核心配置的文件系统信息。
    * interrupts
      > 显示被占用的中断信息和占用者的信息，以及被占用的数量。
    * ioports
      > 当前使用的i/o端口。
    * kcore
      > 系统物理内存映像。与物理内存大小完全一样，然而实际上没有占用这么多内存；它仅仅是在程序访问它时才被创建。(注意：除非你把它拷贝到什么地方，否则/proc 下没有任何东西占用任何磁盘空间。)
    * kmsg
      > 核心输出的消息。也会被送到syslog。
    * ksyms
      > 核心符号表。
    * loadavg
      > 系统“平均负载”；1分钟内运行队列中的平均进程数 (5分钟内) (15分钟内) 运行的进程数/进程总数 最近运行的进程ID号
    * meminfo
      > 各种存储器使用信息，包括物理内存和交换分区(swap)。
    * modules
      > 存放当前加载了哪些核心模块信息。
    * net
      > 网络协议状态信息。
    * self
      > 存放到查看/proc 的程序的进程目录的符号连接。
    * stat
      > 系统的不同状态，例如，系统启动后页面发生错误的次数。
    * uptime
      > 系统启动的时间长度。
    * version
      > 核心版本
* root
  > /root目录是超级用户（root用户）的主目录。与普通用户的主目录（/home）不同，超级用户的主目录位于/root。只有root用户可以访问和操作/root目录。
* run
  > 用于应用程序存储经常变化的文件，比如文件锁、进程ID或者套接字等等。
* sbin
  > 存放的是超级用户权限的系统指令。主要放置一些系统管理的必备程式，只有管理员才可以运行。例如：ifconfig、ip、ip6tables、reboot、service、shutdown等。某些系统会软链接到usr/sbin。
* srv
  > 该目录存储具体服务提供的数据。通常该目录是空的。这个目录中的数据通常是提供给外部的，比如Web网站存储的用户信息。这里需要注意与/var和/tmp的区别，前者是提供给外部用户的，而两者则是应用自己使用的，而且/tmp中的数据重启后会丢失。
* sys
  > /sys目录是一个虚拟文件系统，用于提供关于系统硬件和设备的信息。它是与/sys目录下的文件进行交互的一种方法。
* tmp
  > 应用程序产生的临时数据通常存储在该目录中。该目录有一个特点，就是系统重启后目录中的数据将被清理。
* usr
  > 用户的应用程序和文件。
    * bin
      > 用户后期安装的一些软件的运行脚本。主要放置一些应用软体工具的必备执行档。例如：free、gzip、last、make、wget等。
    * games
      > 放着XteamLinux自带的小游戏。
    * include
      > 包含了c语言的头文件，这些文件多以. h结尾，用来描述c语言程序中用到的数据结构、子过程和常量。为了保持一致性，这实际上应该放在/usr/lib 下，但习惯上一直沿用了这个名字。
    * local
      > 本地安装的软件和其他文件放在这里。这与/usr很相似。用户可能会在这发现一些比较大的软件包，如tex、emacs等。
    * sbin
      > 用户安装的系统管理的必备程式。例如:httpd、sendmail、swap、tcpdump等。
* var
  > /var目录是/usr目录对应的可写目录，在/usr目录中的内容只读的，而/var则是可写的。日志文件和正常操作中的一些写入操作通常会写入/var目录。例如，日志文件通常存储在/var/log中。
    * lib
      > 存放系统正常运行时要改变的文件。
    * local
      > 存放/usr/local 中安装的程序的可变数据(即系统管理员安装的程序)。注意，如果必要，即使本地安装的程序也会使用其他/var 目录，例如/var/lock 。
    * lock
      > 锁定文件。许多程序遵循在/var/lock 中产生一个锁定文件的约定，以用来支持他们正在使用某个特定的设备或文件。其他程序注意到这个锁定文件时，就不会再使用这个设备或文件。
    * log
      > 各种程序的日志( log)文件，尤其是login (/var/log/wtmp log纪录所有到系统的登录和注销) 和syslog (/var/log/messages 纪录存储所有核心和系统程序信息)。/var/log里的文件经常不确定地增长，应该定期清除。
    * run
      > 保存在下一次系统引导前有效的关于系统的信息文件。例如， /var/run/utmp 包含当前登录的用户的信息。
    * spool
      > 放置“假脱机( spool)”程序的目录，如mail、news、打印队列和其他队列工作的目录。每个不同的spool在/var/spool 下有自己的子目录，例如，用户的邮箱就存放在/var/spool/mail中。
    * tmp
      > 比/tmp 允许更大的或需要存在较长时间的临时文件。注意系统管理员可能不允许/var/tmp 有很旧的文件。

### 文件权限

修改目录下所有权限
sudo chmod 777 /目录/ -R
修改目录下所有用户组
chown www:www www -R

### 压缩解压

.zip格式语法：

* zip 压缩文件名 源文件 #压缩文件 （也能压缩目录，但只会压缩第一个目录，目录中的内容并没有压缩进去）
* zip -r 压缩文件名 源目录 #压缩目录
* unzip 压缩文件名 #解压文件

将11.txt文件压缩为:11.zip文件：zip 11.zip 11.txt

将coding目录压缩为:coding.zip文件：zip -r coding.zip coding （由下图可知会压缩目录中的所有内容）

将coding目录压缩为:coding.zip文件：zip coding.zip coding （仅仅只是压缩了coding/,里面不含coding文件夹中原先的内容）

解压coding.zip文件（上图得到的coding.zip文件），可见原来的first.c等文件全部不见了

.gz格式语法：

* gzip 源文件 #压缩为.gz格式的压缩文件，源文件会消失
* gzip -c 源文件 > 压缩文件 #压缩为.gz格式，源文件保留例如：gzip-c cangls>cangls.gz
* gzip -r 目录 #压缩目录下所有的子文件，但是不能压缩目录

gunzip 压缩文件名 #解压压缩文件

.bz2格式语法

* bzip2源文件 #压缩为.bz2格式，不保留源文件
* bzip2 -k源文件 #压缩之后保留源文件
* 注意：bzip2命令不能压缩目录
* bzip2 -d压缩文件 #解压缩，-k保留压缩文件

bunzip2压缩文件 #解压缩，-k保留压缩文件

### 硬盘

查看硬盘

```shell
df
```

### 磁盘扩容

#### 扩大已有MBR分区

以“CentOS 7.4 64bit”操作系统为例，系统盘“/dev/vda”原有容量40GB，只有一个分区“/dev/vda1”。将系统盘容量扩大至100GB，本示例将新增的60GB划分至已有的MBR分区内“/dev/vda1”内。

执行以下命令，安装growpart扩容工具。

```shell
yum install cloud-utils-growpart
```

> 说明：
可以用growpart命令检查当前系统是否已安装growpart扩容工具，若回显为工具使用介绍，则表示已安装，无需重复安装。

执行以下命令，查看系统盘“/dev/vda”的总容量。

```shell
fdisk -l
```

回显类似如下信息：

```shell
[root@ecs-test-0001 ~]# fdisk -l


Disk /dev/vda: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x000bcb4e

Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    83886079    41942016   83  Linux
```

执行以下命令，查看系统盘分区“/dev/vda1”的容量。

```shell
df -TH
```

回显类似如下信息：

```shell
[root@ecs-test-0001 ~]# df -TH
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      ext4       43G  2.0G   39G   5% /
devtmpfs       devtmpfs  2.0G     0  2.0G   0% /dev
tmpfs          tmpfs     2.0G     0  2.0G   0% /dev/shm
tmpfs          tmpfs     2.0G  9.0M  2.0G   1% /run
tmpfs          tmpfs     2.0G     0  2.0G   0% /sys/fs/cgroup
tmpfs          tmpfs     398M     0  398M   0% /run/user/0
```

执行以下命令，指定系统盘待扩容的分区，通过growpart进行扩容。
growpart 系统盘 分区编号

命令示例：

```shell
growpart /dev/vda 1
```

回显类似如下信息：

```shell
[root@ecs-test-0001 ~]# growpart /dev/vda 1
CHANGED: partition=1 start=2048 old: size=83884032 end=83886080 new: size=209713119,end=209715167
```

执行以下命令，扩展磁盘分区文件系统的大小。
resize2fs 磁盘分区

命令示例：

```shell
resize2fs /dev/vda1
```

回显类似如下信息：

```shell
[root@ecs-test-0001 ~]# resize2fs /dev/vda1
resize2fs 1.42.9 (28-Dec-2013)
Filesystem at /dev/vda1 is mounted on /; on-line resizing required
old_desc_blocks = 5, new_desc_blocks = 13
The filesystem on /dev/vda1 is now 26214139 blocks long.
```

执行以下命令，查看扩容后系统盘分区“/dev/vda1”的容量。

```shell
df -TH
```

回显类似如下信息：

```shell
[root@ecs-test-0001 ~]# df -TH
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      ext4      106G  2.0G   99G   2% /
devtmpfs       devtmpfs  2.0G     0  2.0G   0% /dev
tmpfs          tmpfs     2.0G     0  2.0G   0% /dev/shm
tmpfs          tmpfs     2.0G  9.0M  2.0G   1% /run
tmpfs          tmpfs     2.0G     0  2.0G   0% /sys/fs/cgroup
tmpfs          tmpfs     398M     0  398M   0% /run/user/0
```

#### 新增MBR分区

系统盘“/dev/vda”原有容量40GB，只有一个分区“/dev/vda1”。将系统盘容量扩大至80GB，本示例为新增的40GB分配新的MBR分区“/dev/vda2”。

执行以下命令，查看磁盘的分区信息。

```shell
fdisk -l
```

回显类似如下信息：

```shell
[root@ecs-2220 ~]# fdisk -l

Disk /dev/vda: 85.9 GB, 85899345920 bytes, 167772160 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0008d18f

Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    83886079    41942016   83  Linux
```

表示当前系统盘“dev/vda”容量为80 GB，当前正在使用的分区“dev/vda1”为40 GB，新扩容的40 GB还未分配分区。

执行如下命令之后，进入fdisk分区工具。

```shell
fdisk /dev/vda
```

回显类似如下信息：

```shell
[root@ecs-2220 ~]# fdisk /dev/vda
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help):
```

输入“n”，按“Enter”，开始新建分区。
回显类似如下信息：

```shell
Command (m for help): n
Partition type:
p   primary (1 primary, 0 extended, 3 free)
e   extended
```

表示磁盘有两种分区类型：
“p”表示主分区。
“e”表示扩展分区。
说明：
磁盘使用MBR分区形式，最多可以创建4个主分区，或者3个主分区加1个扩展分区，扩展分区不可以直接使用，需要划分成若干个逻辑分区才可以使用。

磁盘使用GPT分区形式时，没有主分区、扩展分区以及逻辑分区之分。

以创建一个主要分区为例，输入“p”，按“Enter”，开始创建一个主分区。
回显类似如下信息：

```shell
Select (default p): p
Partition number (2-4, default 2):
```

以分区编号选择“2”为例，输入分区编号“2”，按“Enter”。
回显类似如下信息：

```shell
Partition number (2-4, default 2): 2
First sector (83886080-167772159, default 83886080):
```

输入新分区的起始磁柱值，以使用默认起始磁柱值为例，按“Enter”。
系统会自动提示分区可用空间的起始磁柱值和截止磁柱值，可以在该区间内自定义，或者使用默认值。起始磁柱值必须小于分区的截止磁柱值。

回显类似如下信息：

```shell
First sector (83886080-167772159, default 83886080):
Using default value 83886080
Last sector, +sectors or +size{K,M,G} (83886080-167772159,default 167772159):
```

输入新分区的截止磁柱值，以使用默认截止磁柱值为例，按“Enter”。
系统会自动提示分区可用空间的起始磁柱值和截止磁柱值，可以在该区间内自定义，或者使用默认值。起始磁柱值必须小于分区的截止磁柱值。

回显类似如下信息：

```shell
Last sector, +sectors or +size{K,M,G} (83886080-167772159,
default 167772159):
Using default value 167772159
Partition 2 of type Linux and of size 40 GiB is set

Command (m for help):
```

输入“p”，按“Enter”，查看新建分区。
回显类似如下信息：

```shell
Command (m for help): p

Disk /dev/vda: 85.9 GB, 85899345920 bytes, 167772160 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0008d18f

Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    83886079    41942016   83  Linux
/dev/vda2        83886080   167772159    41943040   83  Linux
Command (m for help):
```

输入“w”，按“Enter”，将分区结果写入分区表中。
回显类似如下信息：

```shell
Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.
```

表示分区创建完成。

说明：
如果之前分区操作有误，请输入“q”，则会退出fdisk分区工具，之前的分区结果将不会被保留。

执行以下命令，将新的分区表变更同步至操作系统。
partprobe

执行以下命令，设置新建分区文件系统格式。
mkfs -t 文件系统 磁盘分区

ext*文件系统命令示例：
以“ext4” 文件格式为例：

```shell
mkfs -t ext4 /dev/vda2
```

回显类似如下信息：

```shell
[root@ecs-2220 ~]# mkfs -t ext4 /dev/vda2
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
2621440 inodes, 10485760 blocks
524288 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2157969408
320 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
4096000, 7962624

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

xfs文件系统命令示例：

```shell
mkfs -t xfs /dev/vda2
```

回显类似如下信息：

```shell
[root@ecs-2220 ~]# mkfs -t xfs /dev/vda2
meta-data=/dev/vda2              isize=512     agcount=4, agsize=2621440 blks
=                       sectsz=512    attr=2, projid32bit=1
=                       crc=1         finobt=0, sparse=0
data     =                       bsize=4096    blocks=10485760, imaxpct=25
=                       sunit=0       swidth=0 blks
naming   =version2               bsize=4096    ascii-ci=0 ftype=1
log      =internal log           bsize=4096    blocks=5120, version=2
=                       sectsz=512    sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096    blocks=0, rtextents=0
```

格式化需要等待一段时间，请观察系统运行状态，若回显中进程提示为done，则表示格式化完成。

（可选）执行以下命令，新建挂载目录。
若需要挂载至新建目录下，执行该操作。

mkdir 挂载目录

以新建挂载目录“/opt”为例：

```shell
mkdir /opt
```

执行以下命令，挂载新建分区。
mount 磁盘分区 挂载目录

以挂载新建分区“/dev/vda2”至“/opt”为例：

```shell
mount /dev/vda2 /opt
```

说明：
新增加的分区挂载到不为空的目录时，该目录下原本的子目录和文件会被隐藏，所以，新增的分区最好挂载到空目录或者新建目录。如确实要挂载到不为空的目录，可将该目录下的子目录和文件临时移动到其他目录下，新分区挂载成功后，再将子目录和文件移动回来。

执行以下命令，查看挂载结果。

```shell
df -TH
```

回显类似如下信息：

```shell
[root@ecs-2220 ~]# df -TH
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      ext4       43G  2.0G   39G   5% /
devtmpfs       devtmpfs  509M     0  509M   0% /dev
tmpfs          tmpfs     520M     0  520M   0% /dev/shm
tmpfs          tmpfs     520M  7.2M  513M   2% /run
tmpfs          tmpfs     520M     0  520M   0% /sys/fs/cgroup
tmpfs          tmpfs     104M     0  104M   0% /run/user/0
/dev/vda2      ext4       43G   51M   40G   1% /opt
```

说明：
云服务器重启后，挂载会失效。您可以修改“/etc/fstab”文件，将新建磁盘分区设置为开机自动挂载，请参见设置开机自动挂载磁盘分区。

## 用户

|     说明    |     命令    |
| ----------- | ----------- |
|当前在线用户 |who|
|我是谁 |whoami|

### 用户管理

```shell
# 创建xxx用户
useradd xxx
# 修改xxx用户的密码
passwd xxx
```

## 系统

|     说明    |     命令    |
| ----------- | ----------- |
|内核信息 |uname -a|
|输出 |echo $PATH|
|历史命令 |history|

### 环境配置

更新环境

```shell
source /etc/profile
```

## 网络

```shell
apt-get install iftop
iftop
```

放行的端口段
netstat -luntp

### 防火墙

```shell
iptables -L
```

创建
[root@git-node1 ~]#useradd nulige
[root@git-node1 ~]#passwd nulige
让git用户可以执行shell命令
usermod -s /bin/bash git

## 内存

### 扩展内存

分为 Swapfile 、 zram

检查swap

```shell
swapon -s
```

Type=file（Swapfile）

Type=partition（zram）

无（无swap）

#### Swapfile(swap)

内存不够用的时候，将部分内存上的数据交换到swap（硬盘）空间上，以便让系统不会因内存不够用而导致oom或者更致命的情况出现。建议服务器使用

查看swap是否有创建

```shell
free -m
```

使用文件作为swap分区

```shell
#使用dd创建swap文件/data/swapfile，大小为1G
dd if=/dev/zero of=/data/swapfile bs=1M count=1024
#---或---
#使用fallocate创建swap文件/data/swapfile，大小为1G
fallocate -l 1G /data/swapfile
 
#交换文件格式化为swap分区
mkswap /data/swapfile
#设置权限
chmod 600 /data/swapfile
#启用swap分区
swapon /data/swapfile
#设置开机自动启用swap分区
vi /etc/fstab
#添加一行
/data/swapfile swap swap defaults 0 0
```

卸载swap分区

```shell
swapoff /data/swapfile
```

删除swap分区

```shell
rm -rf /data/swapfile
```

设置swap分区使用优先级

```shell
#查看优先级设置，0不使用swap分区，100尽可能使用swap分区，根据需求设置一个中间值即可
cat /proc/sys/vm/swappiness
 
#临时设置优先级，内存占用超过70%后写如swap
sysctl vm.swappiness=30
 
#设置开机自动生效
echo "vm.swappiness = 30"  >>  /etc/sysctl.conf
#加载sysctl.conf参数
sysctl -p
```

释放虚拟内存命令

```shell
# sync命令可以多执行几遍
# drop_caches的值（N）可以是0-3之间的数字，代表不同的含义：
 
# 0：不释放(系统默认值);默认情况下表示不释放内存，由操作系统自动管理;
 
# 1：释放页缓存;
 
# 2：释放dentries和inodes；
 
# 3：释放所有缓存。
 
echo N > /proc/sys/vm/drop_caches
```

#### Swap Partition(zram、交换分区)

zRAM 机制是将进程不常用的内存压缩存储在内存某个区域。 zRAM 机制并不会发生 I/O 操作，从而避免因 I/O 操作导致的性能下降。建议安卓手机使用

监看 zram

```shell
zramctl
```

创建zram

zRAM 是 Linux 内核的模块，要启用 zRAM 请使用 modprobe 命令加载 zRAM 模块。

```shell
modprobe zram num_devices=1
# 然后运行 lsmod 命令确认是否成功加载
lsmod  | grep zram
```

配置 zRAM

```shell
# 设置了 zram0 的大小为 512MB，能够存储 512MB 压缩后的数据。
echo 512M > /sys/block/zram0/disksize
# 更改 zRAM 的压缩算法
echo lzo > /sys/block/zram0/comp_algorithm
# 方括号扩着哪个算法就说明启用了哪个
cat /sys/block/zram0/comp_algorithm
```

持久化开启/加载 zRAM 模块

```shell
# 格式化为zram
mkswap /dev/zram0
# 启用zram
swapon /dev/zram0
```

## screen 多重视窗管理

|     说明    |     命令    |
| ----------- | ----------- |
|创建会话 |screen -S session_name|
|查看所有会话 |screen -ls|
|进入会话 |screen -r session_name|
|关闭会话 | exit |
|离开会话并不关闭 | <kbd>Ctrl</kbd> + <kbd>a</kbd> 然后再按 <kbd>d</kbd> |

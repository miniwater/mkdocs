# 红米ax6

## 介绍

df -h

红米ax6共128M空间

```shell
root@OpenWrt:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00020000 "0:sbl1"
mtd1: 00100000 00020000 "0:mibib"
mtd2: 00300000 00020000 "0:qsee"
mtd3: 00080000 00020000 "0:devcfg"
mtd4: 00080000 00020000 "0:rpm"
mtd5: 00080000 00020000 "0:cdt"
mtd6: 00080000 00020000 "0:appsblenv"
mtd7: 00100000 00020000 "0:appsbl"
mtd8: 00080000 00020000 "0:art"
mtd9: 00080000 00020000 "bdata"
mtd10: 00080000 00020000 "crash"
mtd11: 00080000 00020000 "crash_syslog"
mtd12: 023c0000 00020000 "rootfs"
mtd13: 023c0000 00020000 "rootfs_1"
mtd14: 01ec0000 00020000 "overlay"
mtd15: 00080000 00020000 "rsvd0"
```

```shell
cat /proc/partitions 
major minor  #blocks  name

  31        0       1024 mtdblock0
  31        1       1024 mtdblock1
  31        2       3072 mtdblock2
  31        3        512 mtdblock3
  31        4        512 mtdblock4
  31        5        512 mtdblock5
  31        6        512 mtdblock6
  31        7       1024 mtdblock7
  31        8        512 mtdblock8
  31        9        512 mtdblock9
  31       10        512 mtdblock10
  31       11        512 mtdblock11
  31       12     104704 mtdblock12
  31       13        512 mtdblock13
 254        0      31868 ubiblock0_1
 253        0     138240 zram0
```

mtd12和mtd13为固件分区，不管是小米官方固件还是op固件都只能刷进这个分区。

mtd12和mtd13均只有36M大小。固件尽量控制在30M以内。

## 准备工作

准备软件VirtualBox WinScp CMD。

AX6官方版本1.0.16或1.0.18

## 解锁SSH

### 官方版本降级

通过后台的系统升级功能刷入`miwifi_ra69_firmware_45a77_1.0.18.bin`刷机包。

### 电脑虚拟机模拟openwrt

打开VirtualBox，新建

类型：Linux，版本：Other Linux (64-bit)，使用已有的虚拟硬盘文件：选择镜像文件，创建。

VirtualBox-设置-网络-仅主机(Host-Only)网路，并确保启用网络连接为选中状态。

启动虚拟机。

op默认登录地址为192.168.5.1，所以我们需要打开windows网络连接把`VirtualBox Host-Only Network`的ipv4地址设置成192.168.5.2，之网掩码255.255.255.0。

登录op后台，用户名`root`，密码默认`password`。

把`wireless.sh`上传到op的root目录下。

登录op的SSH，运行上传的文件：`sh /root/wireless.sh`，两次回车。在提示重启网卡的上面有个链接记得复制，如：`http://192.168.31.1/cgi-bin/luci/;stok=<stock>/api/xqsystem/extendwifi_connect_inited_router?ssid=op&password=12345678&admin_username=root&admin_password=password&admin_nonce=xxx`

打开windows热点，设置wifi名称(`op`)及密码(`123456`)，2.4GHz频段，关闭节能。

将热点的IPv4（DHCP）关闭；网络设置里，热点，属性，ipv4的勾勾点掉。

关闭op虚拟机，VirtualBox-设置-网络-网卡1-连接方式：桥接网卡，界面名称：`Microsoft Wi-Fi Direct Virtual Adapter #2`(刚建的移动热点)

启动op，完成。

登录AX6，复制当前AX6后台链接中 "stock=" 后面的字符串；

替换链接中相应的数据后，复制到浏览器点击回车，解锁SSH，如；`http://192.168.31.1/cgi-bin/luci/;stok=52ee...bd6b/api/xqsystem/extendwifi_connect_inited_router?ssid=op&password=12345678&admin_username=root&admin_password=password&admin_nonce=xxx`

大概20秒后会弹出字符，表示成功，如`{"token":"; nvram set ssh_en=1; nvram set uart_en=1; nvram set boot_wait=on; nvram commit; uci set wireless.@wifi-iface[0].key=`mkxqimage -I`; uci commit; sed -i 's/channel=.*/channel=\u0022debug\u0022/g' /etc/init.d/dropbear; /etc/init.d/dropbear start;","code":0}`

此时ax6的5G频段的WiFi密码为SSH密码，也可以通过<https://www.oxygen7.cn/miwifi/> 输入SN码，点击Go，即可弹出SSH密码。

## 不扩容刷机

首先检查当前启动系统（1.0.18）所在分区；`nvram get flag_last_success`，如果返回0为MTD12，返回1为MTD13。

### 分区在MTD13(我)

我返回的是数字1，为MTD13。

此时降级前的官方固件在分区，如

```md
mtd12：0：1.1.10
mtd13：1：1.0.18
```

理想方式保留最新的12分区，刷入13分区，实现共存。

切换当前启动的系统分区为12分区，输入：

```shell
nvram set flag_last_success=0
nvram set flag_boot_rootfs=0
nvram commit
reboot
```

切换12分区后，scp登入ax6，进入`/tmp`文件夹，放入op固件，选择factory结尾固件即可，sysupgrade为升级固件，一般可在页面端升级。

ssh登录ax6，`ubiformat /dev/mtd13 -y -f /tmp/你上传的固件文件名`。

然后切换分区13，输入：

```shell
nvram set flag_last_success=1
nvram set flag_boot_rootfs=1
nvram commit
reboot
```

重启完成即可登录系统，LEAN固件默认ip地址为192.168.1.1，用户名root，没有设置密码。

### 切换分区(如果需要)

> 小米系统下命令是`nvram set`，op系统下命令是`fw_setenv`，不能弄混。
> 切回小米系统要记得关闭自动升级功能，不然op会被覆盖。

OP切换到小米系统

```shell
fw_setenv  flag_last_success 0
fw_setenv flag_boot_rootfs 0
reboot
```

小米系统切换到OP

```shell
nvram set flag_last_success=1
nvram set flag_boot_rootfs=1
nvram commit
reboot
```

## uboot扩容刷机（新）

把 ax6-minbib.bin (扩容分区表文件)以及 uboot-redmi-ax6.bin (改版uboot文件)上传到路由器tmp目录

```shell
mtd erase /dev/mtd1
mtd write /tmp/ax6-mibib.bin /dev/mtd1

mtd erase /dev/mtd7
mtd write /tmp/uboot-redmi-ax6.bin /dev/mtd7
```

断电重启!!!

### 进入uboot

网线相连接

断电

按住reset再接通电源，五秒后松开reset

网页打开192.168.1.1（可能需要网络设置中手动修改电脑IP:192.168.1.2）

刷入中可以把ip地址改回自动获取

## 普通扩容刷机（旧）

mtd12 刷入op固件，在mtd12给mtd13和mtd14(overlay)合并分区
36M+31M=68M

### 刷入mtd12

tmp放入`xiaomimtd12.bin`，执行

```shell
fw_setenv  flag_last_success 0
fw_setenv flag_boot_rootfs 0
mtd write /tmp/xiaomimtd12.bin rootfs
reboot
```

### 进入mtd12

打开 192.168.1.1 检查是否成功

ssh 192.168.1.1 root 无密码

tmp放入`a6minbib.bin`，执行

```shell
. /lib/upgrade/platform.sh
switch_layout boot; do_flash_failsafe_partition a6minbib "0:MIBIB"
```

操作完成后断电重启

然后再打开 192.168.1.1 检查是否重启成功

输入`cat /proc/mtd`查看分区表

### 刷入op

ssh登录ax6，`ubiformat /dev/mtd13 -y -f /tmp/你上传的固件文件名`。

```shell
fw_setenv  flag_last_success 1
fw_setenv flag_boot_rootfs 1
reboot
```

## 路由备份

```
http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/xqsystem/extendwifi_connect_inited_router?ssid=MEDIATEK-ARM-IS-GREAT&password=ARE-YOU-OK&admin_username=root&admin_password=admin&admin_nonce=xxx

http://192.168.31.1/cgi-bin/luci/;stok=4e4e3e3cf2547e526762d3a9471da5da/api/xqsystem/extendwifi_connect_inited_router?ssid=op&password=12345678&admin_username=root&admin_password=password&admin_nonce=xxx

{"token":"; nvram set ssh_en=1; nvram set uart_en=1; nvram set boot_wait=on; nvram commit; uci set wireless.@wifi-iface[0].key=`mkxqimage -I`; uci commit; sed -i 's/channel=.*/channel=\u0022debug\u0022/g' /etc/init.d/dropbear; /etc/init.d/dropbear start;","code":0}
```

root密码: 728de62b

fd9e:a053:7e2d::/48

宽带账号：手机号@139.gd
密码没改过的话是手机号码后六位

### WAN设置

协议：PPPoE

### LAN设置

无线WIFI

ntpd -p ntp.aliyun.com

## 以外bug

如果`nf_conntrack: expectation table full`

```shell
cat /proc/sys/net/netfilter/nf_conntrack_expect_max
echo 1024 > /proc/sys/net/netfilter/nf_conntrack_expect_max
```

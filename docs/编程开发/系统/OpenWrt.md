# OpenWrt

## netfilter 模块

查看 netfilter 相关内核参数一览

```shell
sysctl -a | grep conntrack
```

查看哈希表大小（桶的数量）

```shell
sysctl net.netfilter.nf_conntrack_buckets
```

最大跟踪连接数

```shell
sysctl net.netfilter.nf_conntrack_max
# 默认 nf_conntrack_buckets * 4
 
# max 是 bucket 的多少倍决定了每个桶里的链表有多长，因此默认链表长度为 4
```

哈希表使用情况(相当于openwrt首页的活动连接数)

```shell
sysctl net.netfilter.nf_conntrack_count
```

### 调整内核参数

修改`/etc/sysctl.conf`文件

buckets*4 = max

网上有说法 “nf_conntrack_count 的值持续超过 nf_conntrack_max 的 20% 就该考虑扩容”也是这原因。因为 bucket 的值默认是 max 的 25%，用了 max 的 20% 也就是 80% 的桶都有元素了（假设没冲突）。

`nf_conntrack_expect_max`太小会导致内核报错：`nf_conntrack: expectation table full`

```conf
net.netfilter.nf_conntrack_buckets = 16384
net.nf_conntrack_max = 65536

net.netfilter.nf_conntrack_expect_max = 256
```

保存后执行 `sysctl -p` 使之生效

类似的还有

修改ARP的neighbour带机量

```conf
net.ipv4.neigh.default.gc_thresh1 = 2048
net.ipv4.neigh.default.gc_thresh2 = 4096
net.ipv4.neigh.default.gc_thresh3 = 8192
net.ipv6.neigh.default.gc_thresh1 = 2048
net.ipv6.neigh.default.gc_thresh2 = 4096
net.ipv6.neigh.default.gc_thresh3 = 8192
```

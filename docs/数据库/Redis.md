# Redis

codis

String
Hash 对象
List 数组
Set 无序集合
Set 有序集合
Hyperloglog 统计，所需空间固定
Geo 地理位置
Stream 消息队列


redis-cli
redis-benchmark
redis-sentinel
apt install ...

config get requirepass获取密码
config set requirepass设置密码
auth


set key value
get key
move key 1 删除key
expire key second 设置过期数据
ttl key 查看剩余时间
type key 查看类型
keys *表所有的key
dbsize表大小
select num选择表
flushdb清空当前表
flushall情况全部表
exists key判断是否存在

value:2:name asd

String类型
计数器
统计多单位的数量
粉丝数
对象缓存存储

append key valus 追加字符串（如果不存在就set）
strlen key 字符串长度
incr key 自增1
decr  key 自减1
incrby key num自增
incrby key num自增
getrange key num（0） num（-1） 截取（全部）字符串
setrange key num value 替换指定部分字符串
setex 设置过期时间
setnx 如果不存在就创建（分布式锁
mset 批量设置
mget 批量读取
msetnx 批量如果不存在就创建（分布式锁）原子操作
getset 先拿再改

list类型（有序可重复
消息队列
栈

lpush key value 列表左边插入
rpush key value 列表右边插入
lrange key num(0) num(-1) 
lpop key 列表左边移除
rpop key
lindex key num 获取值
llen key 返回长度
lrem key num value 移除指定的值（从左
ltrim key num num 截取指定下标的值，会修改
rpoplpush 移除列表最后一个元素并移动到其他列表中
lset key num value 设置指定下标的值（不会新建
linsert key ? value value 再某个值前、后插入一个值

set集合（无序不重复
共同好友

sadd key value 添加集合
smembers key 查询集合
sismember key value 查询指定值是否在集合
scard key 获取集合中的个数
srandmember key 随机返回一个数
spop key 随机移除一个并返回
smembers key1 key2 value k1移动一个值到k2另一个集合
sdiff key1 key2 差集
sinter key1 key2 交集
sunion 并集

hash哈希（对象
用户信息保存

hset 赋值
hget 取值
hmset 同时设置多个值
hgetall 全部获取字段和值
hdel 删除指定key
hlen 获取长度
hexists 判断指定字段是否存在
hkeys 获取所有的字段
hincrby 自增
hsetnx 不存在就赋值（锁

zset有序集合（有序不重复
班级成绩表，工资表
1未看2看过 带权重
排行榜

zadd添加
zrange 获取
zrangebyscore 排序（withscores
ZREVRANGE
zrem 移除
zcard 获取长度
zcount 获取指定区间的成员数量

geospatial地理空间（可使用zset

geoadd 添加
geopos 获取
geodist 两定位的距离（带参
georadius 附近的位置（带参
georadiusbymember 位置附近的位置
geohash 经纬度转为字符串，越像越近

hyperloglog基数统计
占用内存固定(0.81容错

pfadd 添加
pfcount 数量
pfmerge 合并

bitmaps位存储
登录未登录打卡

setbit 设置
getbit 读
gitcount 统计



事务
一次性 顺序性 排他性
没有隔离概念
redis单条保证原子性，事务不保证原子性
开启事务（multi）
命令入队（.........）
执行事务（exec）
放弃事务（discard）
代码错误所有命令不执行

watch 乐观锁
unwatch

订阅
事实交流系统
psubscribe 订阅给定模式频道
pubsub 查看状态
publish 发送信息
punsubscribe 退订所有
subscribl 订阅频道
unsubscribe 退订指定

主从复制
info replication 查看信息
slaveof 认主机
slaveof no one 手动断开

哨兵模式*
redis-sentinel /www/server/redis/sentinel.conf

缓存穿透 越过redis打数据库
缓存击穿 热点keys过期打数据库
缓存雪崩 key集体失效
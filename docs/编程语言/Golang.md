# Golang

## 安装

> 屎一样的包管理
>
> 垃圾
>
> 每个版本都改

### GoPath 目录

* bin
* pkg
* src

### 环境变量

用户变量

| 变量   | 值               |
| ------ | ---------------- |
| GOPATH | *:\\\*\GoPath    |
| Path   | {go安装目录}\bin |

### 全局变量修改（永久）

```go
go env -w GO111MODULE="on"
```

国内代理

```go
go env -w GOPROXY=https://goproxy.cn,direct
```

### 配置

```shell
go env
```

### 新建项目

GoPath/src 目录下

```shell
mkdir hello
cd hello

//包管理
go mod init
```

整理依赖

* 删除不需要的依赖包
* 下载新的依赖包
* 更新go.sum

```
go mod tidy
```

## 输出

换行

```go
fmt.Println("Hello")
```

```go
fmt.Printf("asdasd %v a%vsda", 123, 123)
```

防止转义

```go
fmt.Println("asda\asda")

fmt.Println(`asda\asda`)
```

## 变量

### 基本类型

#### 基本类型

```go
bool
string
int int8 int16 int32 int64
uint uint8 uint16 uint32 uint64 uintptr
byte == uint8
rune == int32 //表示unicode码点
float32 float64
complex64 complex128
```

#### 类型转换

string 转 int

```go
int,err:=strconv.Atoi(str)
```

int 转 string

```go
string:=strconv.ltoa(int)
```

string 转 []byte

```go
var data []byte = []byte(str)
```

[]byte 转 string

```go
var str string = string(data[:])
```

float64 互转 string

```go
float,err := strconv.ParseFloat(string,64)
string := strconv.FormatFloat(float64,'E',-1,64)
```

### 简短形式

```go
count := 20
```

### var

```go
var count =10
```

或者

```go
var count int 
count = 1
```

声明类型

```go
var count float64 = 3.1415
var count float32 = math.Pi
var count float32
var count uint = 123
var count int64 = 123
var count uint64 = 41.3e14
var count float64 = 41.3e19
```

### 多变量

```go
var a, b int
var c string
a, b, c = 5, 7, "abc"
```

```go
var java,c,test=1,"dfrer",true

java,c,test:=1,"dfrer",true
```

### 很大的数

SetString(数字，进制)

```go
count := new(big.Int)

count.SetString("20000000000000000000000000000000000000000000000000000000000000000000000000", 10)
```

或者

```go
count := new(big.Int).SetString("20000000000000000", 10)
```

### 随机数

```go
rand.Intn(100)
```

### 指针

内存地址

```go
bcd := &abc

fmt.Println(bcd)
```

内存地址获取变量

```go
bcd := &abc

fmt.Println(*bcd)
```

## 常量

```go
const dostamce = 200000000
```

多个常量

```go
const (
    a = 0
    b = 1
    c = 2
)
```

## if 判断

``` go
if command == "go east" {
 fmt.Println("123s")
}
if !(command == "go east") {
 fmt.Println("123s")
}
```

```go
if commands := "a"; commands == "a" {
 fmt.Println("abc")
}
```

## for 循环

例子

默认

```go
for i := 0; i < 5; i++ {
 println(i)
    if i = 4 {
  break
 }
}

for key, v := range user.User_order {
  fmt.Println(v)
     fmt.Println(key)
 }


for _, v := range user.User_order {
  fmt.Println(v)
  o.LoadRelated(v.User, "User_order")
 }

```

定义

```go
var count = 10
for count < 50 {//true就进行循环
 println(count)
 count++
}
```

死循环

```go
for{
    //die
}
```

## switch

自带break

例子

```go
switch command {
case "go east":
 fmt.Println("123s")
case "walk outside":
 fmt.Println("aaaa")
}
```

执行前先执行语句

```go
switch v:=x+y;v{
}
```

没有条件的switch

```go
switch {
case command == "go east":
 fmt.Println("1")
case command == "walk outside":
 fmt.Println("2")
    fallthrough //执行下一个(case或default)
 // case command == "a":
 //  fmt.Println("1")
default:
 fmt.Println("default")
}
```

## array 数组

### 声明

一维数组

```go
var planets [2]string
planets[0] = "a"
planets[1] = "b"
```

```go
dwarfs := [...]string{
 "a",
 "b"
}
```

二维数组

```go
a := [2][3]int{{1,1,1},{2,2,2}}
```

```go
a := [...][2]int{{1,1},{2,2},{3,3},{4,4}}
```

### for循环

一维数组

```go
for i, dwarf := range dwarfs {
 println(i, dwarf)
}
```

二维数组

```go
a := [2][3]string{{"a", "b", "c"}, {"d", "e", "f"}}

for k1,v1 := range arr{
    fmt.Println(k1,v1)//0 [a b c]
    
    for k2,v2 := range v1{
        fmt.Println(k2,v2)//0 a
    }
}
```

### 切片

例子

```go
array := string{"a","b","c"}
terrestrial := array[0:1]

```

限制切片容量

```go
array := string{"a","b","c"}
terrestrial := array[0:1:2]
```

预分配

声明长度和容量

```go
//长度10 容量20
var a []int = make([]int, 10, 20)

b := make([]int, 0, 2130)

//省略 长度10 容量10
var a []int = make([]int, 10)
b := make([]int , 10)
```

append

``` go
dwarf := []string{"a", "b", "c"}
dwarf = append(dwarf, "d","e")
fmt.Println(dwarf)
```

输出

```go
[a b c d e]
```

### 长度

现有长度

```go
println(len(array))
```

### 容量

数组可存放长度上限

```go
println(cap(array))
```

## map 对象

赋值不会复制，指向同一个内存

```go
obj := map[string]int{
 "code": 200,
 "msg":  123,
}

fmt.Println(obj["code"])
//200

fmt.Println(obj["no"])
//0
```

简短形式

```go
obj := []float64{
 2.2, 3.4, 123.2,
}
```

赋值

```go
obj["data"]=123
```

### 预声明

```go
tem := make(map[float64]int, 2)
tem[2.2] = 2
tem[2.3] = 3
tem[2.4] = 4
```

### 逗号与ok

```go
if data, ok := obj["code"]; ok {
 fmt.Println(data)
} else {
 fmt.Println("?")
}
```

### 删除

```go
delete(obj, "msg")
```

### for循环

```go
for _, t := range obj {
 fmt.Println(t)
}

//2.2 3.4 123.2

for a, t := range obj {
 fmt.Println(a)
}
//0 1 2
```

## func 函数

命名

包内可以小写

外部使用必须大写

返回int类型和错误

```go
func funcDemo (a ...interface{}) (int, error) {
 return 1
}
```

//可变参数

```go
func asad(pre int, word ...string) []string {
 pre++
 return word
}

fmt.Println(asad(2, "aassa", "asd"))

a := []string{"aassa", "asd"}
fmt.Println(asad(2, a...))//函数能修改a

//[aassa asd]
```

## 辅助函数

### string

*断字符串s中是否包含个子串str。包含或者str为空则返回true*

```go
var command = "walk outside"
var exit = strings.Contains(command, "outside")
fmt.Println(exit)
//true
```

休眠

```go
time.Sleep(time.Second)
```

## beego

### bee工具创建

#### new

新建一个 Web 项目

```shell
bee new myproject
```

#### api

新建一个 Api 项目

```shell
bee api apiproject
```

#### run

运行

```shell
bee run
```

#### pack

打包

```shell
bee pack
```

#### version

版本号

```shell
bee version
```

#### generate

自动生成代码

#### migrate

数据库迁移

#### dockerize

docker化应用

```shell
bee dockerize -image="library/golang:1.6.4" -expose=9000
```

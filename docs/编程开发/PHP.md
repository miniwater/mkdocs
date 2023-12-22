# PHP

PHP-FPM(FastCGI Process Manager：FastCGI进程管理器)是一个PHPFastCGI管理器

session的常见实现要借助cookie来发送sessionID.
session = cookie + 其他东西根据实际需求而产生的东西

## 数组函数

```php
<?php
array_key_change_case($arr,$case)：将数组所有的键转化为大写或者小写，$case可设为CASE_LOWER或者CASE_UPPER。
array_chunk($arr,$number)：把数组分割为有特定($number)个元素的数组块。
array_column($arr,$column)：返回数组中某一个单列的值。
array_combine($arr1,$arr2)：合并两个数组为一个新数组，并把$arr1的值作为键，$arr2的值作为值。
array_count_values(Array('a','b','c','a','b'))：返回数组中所有值出现的次数，函数执行结果：Array ( [a] => 2 [b] => 2 [c] => 1 )。
array_diff($arr1,$arr2)：返回两个数组的差集(只比较键值)
array_diff_key($arr1,$arr2)：返回两个数组的差集(只比较键名)，该数组返回在$arr1中，但不在 $arr2中的元素。
array_intersect($arr1,$arr2)：比较数组，返回两个数组的交集。
array_key_exists($key,$arr)：查询数组中是否存在指定的键名。
array_keys($arr)：返回数组中所有的键名，并且组成一个新数组。
array_map('myFunction',$arr)：将用户自定义函数作为回调函数作用在数组的每个元素上，返回一个新数组。
array_merge($arr1,$arr2,$arr3.....)：合并一个或多个元素为一个新数组，如果两个或更多元素有相同的键名，后者会覆盖前者。
array_merge_recursive($arr1,$arr2,$arr3.....)：合并一个或多个元素为一个新数组，如果两个或更多元素有相同的键名，后者不会覆盖前者，而会递归创建一个新数组。
array_pop($arr)：删除数组中的最后一个元素(出栈)。
array_product(Array(1,2,3))：计算数组中所有值的乘积。
array_push($arr,'a','b')：将一个或多个元素插入数组的末尾(入栈)。
array_rand($arr,number)：返回一个包含随机键名的数组。
array_replace($arr1,$arr2)：后面数组的值替换前面数组的值。
array_reverse($arr1,$arr2)：将数组中的元素逆序输出(反转)
array_search('a',$arr)：在数组中搜索给定的键名，成功的话返回它的键名。
array_shift()：删除数组中的第一个元素，并返回被删除元素的值。
array_sum()：返回数组中所有值的和。
array_unshift()：在数组开头插入一个或多个元素。
array_values()：返回数组中所有的值。
array_walk($arr,'myFunction')：对数组中的每个成员应用自定义函数。
arsort()：对关联数组按照键值降序排列。
asort()：对关联数组按照键值升序排列。
current()：返回数组中的当前元素(第一个指针指向的元素)。
in_array('a',$arr)：搜索数组中是否存在指定的值。
krsort()：把数组按照键名降序排列。
ksort()：把数组按照键名降升序序排列。
list()：把数组中的值赋给一些变量。list($a,$b,$c) = array(1,2,3)。
?>
```

## 设计模式

高内聚低耦合

### 单例模式

> 只内部new一次，后面可以一直调用

mysql链接

### 简单工厂模式

> 定义个抽象的类，让子类去继承实现它

### 工厂模式

> 工厂设计模式常用于根据输入参数的不同或者应用程序配置的不同来创建一种专门用来实例化并返回其对应的类的实例。

### 适配器模式

> 将一个类的接口转换成客户希望的另一个接口,适配器模式使得原本的由于接口不兼容而不能一起工作的那些类可以一起工作。

应用场景：老代码接口不适应新的接口需求，或者代码很多很乱不便于继续修改，或者使用第三方类库。例如：php连接数据库的方法：mysql,,mysqli,pdo,可以用适配器统一

### 观察者模式

> 一个对象通过提供方法允许另一个对象即观察者 注册自己）使本身变得可观察。当可观察的对象更改时，它会将消息发送到已注册的观察者。

### 策略模式

> 将一组特定的行为和算法封装成类，以适应某些特定的上下文环境。

例如：一个电商网站系统，针对男性女性用户要各自跳转到不同的商品类目，并且所有广告位展示不同的广告

### 原型模式

　　原型模式（对象克隆以避免创建对象时的消耗）
　　1：与工厂模式类似，都是用来创建对象。
　　2：与工厂模式的实现不同，原型模式是先创建好一个原型对象，然后通过clone原型对象来创建新的对象。这样就免去了类创建时重复的初始化操作。
　　3：原型模式适用于大对象的创建，创建一个大对象需要很大的开销，如果每次new就会消耗很大，原型模式仅需要内存拷贝即可。

### 装饰器模式

data->where（）
　　1：装饰器模式，可以动态的添加修改类的功能
　　2：一个类提供了一项功能，如果要在修改并添加额外的功能，传统的编程模式，需要写一个子类继承它，并重写实现类的方法
　　3：使用装饰器模式，仅需要在运行时添加一个装饰器对象即可实现，可以实现最大额灵活性。

　　使用场景：当某一功能或方法draw，要满足不同的功能需求时，可以使用装饰器模式；

#### 魔术方法

constuct()构造函数

```php
<?php
class Stu {
 public $stu_name;
 public $stu_age;

//构造方法，实例化时自动调用
 public function construct($name,$age){
  $this->stu_name = $name;
  $this->stu_age = $age;
 }
}

//实例化stu对象
$stu = new Stu('孙悟空','500');
?>
```

destruct()析构方法
与构造方法是一对，构造方法是在一个对象“出生”的时候由系统自动调用的，而析构方法是在一个对象“消失”的时候由系统自动调用的！
析构方法的名字叫destruct()；注意里面不能有任何的参数！

```php
<?php
//析构方法
public function destruct(){
}
?>
```

clone()克隆
触发时机：是在克隆一个对象的时候，对新对象进行初始化的工作

```php
<?php
//克隆方法在克隆对象的时候对新对象的初始化工作
public function clone(){
 $this->is_clone=true;
}　
?>
```

autoload()自动加载类
当调用不存在的类的时候自动调用！

```php
<?php
/**
* 自动加载类
* 需要什么类autoload会自动调用需要的文件
*
*/

public function autoload($class_name)
{
 require_once "../Model/{$class_name}.class.php";
}
?>
```

tostring()

invoke()

set()

get()

unset()

isset()

call()
当调用无法访问的普通方法时自动触发

```php
<?php
class Stu{
 public function call(){
　　echo "error";
 }
}

$stu = new Stu();

//此时Stu类里没有show()方法，会触发call()函数
$stu->show();
?>
```

callststic()
当无法通过静态方法访问时自动触发

```php
<?php
class Stu{
 public static function callstatic(){
  echo "error";
 }
}

$stu = new Stu();

//此时Stu类里没有show()方法，会触发call()函数
$stu::show();
?>
```

#### 时序攻击

在密码学中,时序攻击是一种侧信道攻击,攻击者试图通过分析加密算法的时间执行来推导出密码。每一个逻辑运算在计算机需要时间来执行,根据输入不同,精确测量执行时间,根据执行时间反推出密码。

如果是用普通的 == 来进行比较，那么两个字符串是从第一位开始逐一进行比较的，发现不同就立即返回 false，那么通过计算返回的速度就知道了大概是哪一位开始不同的，这样就实现了电影中经常出现的按位破解密码的场景。

所以php中为了应对这种情况,可以使用hash_equals函数。

```php
<?php
$expected  = crypt('12345', '$2a$07$usesomesillystringforsalt$');
$correct   = crypt('12345', '$2a$07$usesomesillystringforsalt$');
$incorrect = crypt('apple',  '$2a$07$usesomesillystringforsalt$');

var_dump(hash_equals($expected, $correct));//true
var_dump(hash_equals($expected, $incorrect));//false
?>
```

#### 垃圾回收机制

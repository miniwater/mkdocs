# HTML5

## 普通html5模板

```html
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8" />
    <title>title</title>
    <style>
      body {
        margin: 0;
      }
    </style>
  </head>

  <body>
    <script>

    </script>
  </body>
</html>
```

## 鼠标特效

需要安装jQ

### 富强民主文明

```html
<script type="text/javascript">
//定义获取词语下标
var a_idx = 0;
jQuery(document).ready(function($) {
    //点击body时触发事件
    $("body").click(function(e) {
    //需要显示的词语
    var a = new Array("富强","民主", "文明", "和谐","自由", "平等", "公正","法治", "爱国", "敬业","诚信", "友善");
    //设置词语给span标签
    var $i = $("<span/>").text(a[a_idx]);
    //下标等于原来下标+1  余 词语总数
    a_idx = (a_idx + 1)% a.length;
    //获取鼠标指针的位置，分别相对于文档的左和右边缘。
    //获取x和y的指针坐标
    var x = e.pageX, y = e.pageY;
    //在鼠标的指针的位置给$i定义的span标签添加css样式
    $i.css({"z-index" : 999999999999999999999999999999999999999999999999999999999999999999999,
        "top" : y - 25,
        "left" : x,
        "position" : "absolute",
        "font-weight" : "bold",
        "color" : "#ff6651"
        });
    //在body添加这个标签
    $("body").append($i);
        //animate() 方法执行 CSS 属性集的自定义动画。
        //该方法通过CSS样式将元素从一个状态改变为另一个状态。CSS属性值是逐渐改变的，这样就可以创建动画效果。
        //详情请看http://www.w3school.com.cn/jquery/effect_animate.asp
        $i.animate({
        //将原来的位置向上移动180
            "top" : y - 180,
                "opacity" : 0
         //1500动画的速度
        }, 1500, function() {
        //时间到了自动删除
            $i.remove();
        });
    });
});
</script>
```

### 会变色的富强民主文明

```html
<script type="text/javascript"> 
/* 鼠标特效 */
var a_idx = 0; 
jQuery(document).ready(function($) { 
    $("body").click(function(e) { 
        var a = new Array("富强", "民主", "文明", "和谐", "自由", "平等", "公正" ,"法治", "爱国", "敬业", "诚信", "友善"); 
		var b = new Array("red","aqua","yellow","green","pink","maroon","orange");
        var $i = $("<span/>").text(a[a_idx]); 
        a_idx = (a_idx + 1) % a.length; 
		b_idx = (a_idx+1)%7;/* 七中颜色变色 */
        var x = e.pageX, 
        y = e.pageY; 
        $i.css({ 
            "z-index": 9999, 
            "top": y - 25, 
            "left": x, 
            "position": "absolute", 
            "font-weight": "bold", 
            "color": b[b_idx]
        }); 
        $("body").append($i); 
        $i.animate({ 
            "top": y - 180, 
            "opacity": 0 
        }, 
        1500, 
        function() { 
            $i.remove(); 
        }); 
    }); 
}); 
</script>
```

### 随机二进制数字点击特效

```html
<script>  
    jQuery(document).ready(function($) {  
    var _click_count=0;  
    $("body").bind("click",function(e){
        var n=Math.round(Math.random()*100)+1;//生成100以内的随机数
          if(n == 0) res= '0';
          var res = '';  
          while(n != 0) {
              res = n % 2 + res
              n = parseInt(n / 2)
          }//将n转化为二进制数res
        var $i=$("<b>").text("+"+(res));
        var x=e.pageX,y=e.pageY;//鼠标点击的坐标
        $i.css({  
            "z-index":99999,  
            "top":y-15,  
            "left":x,  
            "position":"absolute",  
            "color":"rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"//颜色随机
            //"#2299DD"  //固定颜色
            });  
            $("body").append($i);  
            $i.animate({
                "top":y-180,
                "opacity":0
                },  
                1500,  
                function(){$i.remove();}  
            );  
            e.stopPropagation();  
        });  
    });  
</script>
```
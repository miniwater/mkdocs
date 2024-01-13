# HTML5

如果不想用jq版本，可以把代码发给chatgpt让它转为js语法。

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

## 添加左上角FPS

```html
<script>
	document.body.insertAdjacentHTML('afterbegin', '<div id="fps" style="z-index:10000;position:fixed;top:3;left:3;font-weight:bold;font-size:11px;"></div>');
var showFPS = (function() {
    var requestAnimationFrame =
        window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        function(callback) {
            window.setTimeout(callback, 1000/60);
        };
    var e, pe, pid, fps, last, offset, step, appendFps;

    fps = 0;
    last = Date.now();
    step = function() {
        offset = Date.now() - last;
        fps += 1;
        if (offset >= 1000) {
            last += offset;
            appendFps(fps);
            fps = 0;
        }
        requestAnimationFrame(step);
    };
    appendFps = function(fps) {
        document.getElementById('fps').innerHTML = fps + 'FPS';
    };
    step();
})();
</script>
```

jQ版本

```html
<script>
    // $('body').before('<div id="fps" style="z-index:10000;position:fixed;top:3;left:3;font-weight:bold;font-size:11px;color:white"></div>');
    jQuery('body').prepend('<div id="fps" style="z-index:10000;position:fixed;top:3;left:3;font-weight:bold;font-size:11px;"></div>');
    var showFPS = (function(){ 
    var requestAnimationFrame =  
        window.requestAnimationFrame || 
        window.webkitRequestAnimationFrame || 
        window.mozRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        window.msRequestAnimationFrame || 
        function(callback) { 
            window.setTimeout(callback, 1000/60); 
        }; 
    var e,pe,pid,fps,last,offset,step,appendFps; 
 
    fps = 0; 
    last = Date.now(); 
    step = function(){ 
        offset = Date.now() - last; 
        fps += 1; 
        if( offset >= 1000 ){ 
        last += offset; 
        appendFps(fps); 
        fps = 0; 
        } 
        requestAnimationFrame( step ); 
    }; 
    appendFps = function(fps){ 
        // console.log(fps+'FPS');
        $('#fps').html(fps+'FPS');
    };
    step();
})();
</script>
```

## 鼠标特效 jQ

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

### 鼠标点击爆炸效果

```html
<script>
    function clickEffect() {
        let balls = [];
        let longPressed = false;
        let longPress;
        let multiplier = 0;
        let width, height;
        let origin;
        let normal;
        let ctx;
        const colours = ["#F73859", "#14FFEC", "#00E0FF", "#FF99FE", "#FAF15D"];
        const canvas = document.createElement("canvas");
        document.body.appendChild(canvas);
        canvas.setAttribute("style", "width: 100%; height: 100%; top: 0; left: 0; z-index: 99999; position: fixed; pointer-events: none;");
        const pointer = document.createElement("span");
        pointer.classList.add("pointer");
        document.body.appendChild(pointer);
 
        if (canvas.getContext && window.addEventListener) {
            ctx = canvas.getContext("2d");
            updateSize();
            window.addEventListener('resize', updateSize, false);
            loop();
            window.addEventListener("mousedown", function(e) {
                pushBalls(randBetween(10, 20), e.clientX, e.clientY);
                document.body.classList.add("is-pressed");
                longPress = setTimeout(function(){
                    document.body.classList.add("is-longpress");
                    longPressed = true;
                }, 500);
            }, false);
            window.addEventListener("mouseup", function(e) {
                clearInterval(longPress);
                if (longPressed == true) {
                    document.body.classList.remove("is-longpress");
                    pushBalls(randBetween(50 + Math.ceil(multiplier), 100 + Math.ceil(multiplier)), e.clientX, e.clientY);
                    longPressed = false;
                }
                document.body.classList.remove("is-pressed");
            }, false);
            window.addEventListener("mousemove", function(e) {
                let x = e.clientX;
                let y = e.clientY;
                pointer.style.top = y + "px";
                pointer.style.left = x + "px";
            }, false);
        } else {
            console.log("canvas or addEventListener is unsupported!");
        }
 
 
        function updateSize() {
            canvas.width = window.innerWidth * 2;
            canvas.height = window.innerHeight * 2;
            canvas.style.width = window.innerWidth + 'px';
            canvas.style.height = window.innerHeight + 'px';
            ctx.scale(2, 2);
            width = (canvas.width = window.innerWidth);
            height = (canvas.height = window.innerHeight);
            origin = {
                x: width / 2,
                y: height / 2
            };
            normal = {
                x: width / 2,
                y: height / 2
            };
        }
        class Ball {
            constructor(x = origin.x, y = origin.y) {
                this.x = x;
                this.y = y;
                this.angle = Math.PI * 2 * Math.random();
                if (longPressed == true) {
                    this.multiplier = randBetween(14 + multiplier, 15 + multiplier);
                } else {
                    this.multiplier = randBetween(6, 12);
                }
                this.vx = (this.multiplier + Math.random() * 0.5) * Math.cos(this.angle);
                this.vy = (this.multiplier + Math.random() * 0.5) * Math.sin(this.angle);
                this.r = randBetween(8, 12) + 3 * Math.random();
                this.color = colours[Math.floor(Math.random() * colours.length)];
            }
            update() {
                this.x += this.vx - normal.x;
                this.y += this.vy - normal.y;
                normal.x = -2 / window.innerWidth * Math.sin(this.angle);
                normal.y = -2 / window.innerHeight * Math.cos(this.angle);
                this.r -= 0.3;
                this.vx *= 0.9;
                this.vy *= 0.9;
            }
        }
 
        function pushBalls(count = 1, x = origin.x, y = origin.y) {
            for (let i = 0; i < count; i++) {
                balls.push(new Ball(x, y));
            }
        }
 
        function randBetween(min, max) {
            return Math.floor(Math.random() * max) + min;
        }
 
        function loop() {
            ctx.fillStyle = "rgba(255, 255, 255, 0)";
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            for (let i = 0; i < balls.length; i++) {
                let b = balls[i];
                if (b.r < 0) continue;
                ctx.fillStyle = b.color;
                ctx.beginPath();
                ctx.arc(b.x, b.y, b.r, 0, Math.PI * 2, false);
                ctx.fill();
                b.update();
            }
            if (longPressed == true) {
                multiplier += 0.2;
            } else if (!longPressed && multiplier >= 0) {
                multiplier -= 0.4;
            }
            removeBall();
            requestAnimationFrame(loop);
        }
 
        function removeBall() {
            for (let i = 0; i < balls.length; i++) {
                let b = balls[i];
                if (b.x + b.r < 0 || b.x - b.r > width || b.y + b.r < 0 || b.y - b.r > height || b.r < 0) {
                    balls.splice(i, 1);
                }
            }
        }
    }
    clickEffect();//调用特效函数
</script>

```

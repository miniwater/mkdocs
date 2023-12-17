# docsify

## 安装

npm安装

```bash
npm i docsify-cli -g
docsify init ./docs
```

或者

新建index.html文件

```html
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css">
</head>
<body>
  <div id="app"></div>
  <script>
    window.$docsify = {
      //...
    }
  </script>
  <script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
</body>
</html>
```

## 运行

```bash
docsify serve docs
```

或者

```bash
docsify serve
```

> [docsify官方文档](https://docsify.js.org/)

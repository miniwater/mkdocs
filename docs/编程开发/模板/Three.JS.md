# Three.JS

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>My first three.js app</title>
    <style>
      body {
        margin: 0;
      }
    </style>
    <script type="importmap">
      {
        "imports": {
          "three": "https://unpkg.com/three@0.158.0/build/three.module.js",
          "three/addons/": "https://unpkg.com/three@0.158.0/examples/jsm/"
        }
      }
    </script>
    <!-- 不要忘记将上述链接中的 <version> 替换为 three.js 的实际版本，如 "v0.158.0"。最新版本可在 npm 版本列表中找到。 -->
    <!-- https://www.npmjs.com/package/three?activeTab=versions -->
  </head>

  <body>
    <script type="module">
      import * as THREE from "three";
      import { OrbitControls } from "three/addons/controls/OrbitControls.js";

      //场景
      const scene = new THREE.Scene();
      scene.background = null;

      //相机
      const camera = new THREE.PerspectiveCamera( //PerspectiveCamera透视摄像机
        75, //第一个参数是视野角度（FOV）
        window.innerWidth / window.innerHeight, //长宽比（aspect ratio）
        0.1, //近截面（near）
        1000 //远截面（far）当物体某些部分比摄像机的远截面远或者比近截面近的时候，该这些部分将不会被渲染到场景中。
      );

      //渲染器
      const renderer = new THREE.WebGLRenderer({
        alpha: true,
      });
      renderer.setSize(window.innerWidth, window.innerHeight); //渲染区域的宽高
      document.body.appendChild(renderer.domElement); //将 renderer（渲染器）的dom元素（renderer.domElement）添加到我们的 HTML 文档中

      //轨道控制器(鼠标放大、缩小、移动)
      const controls = new OrbitControls(camera, renderer.domElement);
      camera.position.set(0, 2, 2);
      controls.update();

      //光源
      const light = new THREE.AmbientLight(0xffffff); // AmbientLight基本光源
      scene.add(light);

      //创建一个立方体
      const geometry = new THREE.BoxGeometry(1, 1, 1);
      //MeshBasicMaterial基本材质
      const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
      //网格包含一个几何体以及作用在此几何体上的材质，我们可以直接将网格对象放入到我们的场景中，并让它在场景中自由移动。
      const cube = new THREE.Mesh(geometry, material);
      //add的时候，物体将会被添加到 (0,0,0) 坐标，可能使得摄像机和立方体彼此在一起
      scene.add(cube);

      //渲染场景
      function animate() {
        requestAnimationFrame(animate); //requestAnimationFrame当用户切换到其它的标签页时，它会暂停
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;
        renderer.render(scene, camera);
      }

      animate();
    </script>
  </body>
</html>
```

# Vue

## Vue 3.2

js写法

```vue
<template>
 <view>
  <button @tap="test">{{name}}</button>
 </view>
</template>

<script setup>
 import {
  computed,
  reactive,
  ref
 } from 'vue';
 const name = ref("哈哈")
 const list = reactive({
  a: 1,
  b: 2
 })
 const sun = computed(() => {
  return name.value + list.b
 })

 function test() {
  name.value = "笨蛋";
  console.log(list)
 }

</script>

<style>
</style>
```

## Vue 3.0

```vue
<template>
 <view>
  <button @tap="test">{{name}}</button>
 </view>
</template>

<script>
 import {
  ref
 } from 'vue';
 export default {
  setup() {
    const name = ref("哈哈");
    function test() {
    name.value = "笨蛋"
   }
   return {
    name,
    test
   };
  }
 }
</script>

<style>
</style>
```

## Vue 2.0

```vue
<template>
 <view>
  <button @tap="test">{{name}}</button>
 </view>
</template>

<script>
 export default {
  data() {
   return {
    name: "哈哈",
   }
  },
  methods: {
   test() {
    this.name="笨蛋";
   }
  }
 }
</script>

<style>
</style>
```

<template>
  <div id="app">
    <home-header></home-header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from './components/Head'
import Test from './components/test.vue'

export default {
  name: 'app',
  components: {
    'home-header': Header,
    'test': Test
  }
}
</script>

<style scoped>
  .box {
    width: 200px;
    height: 100px;
    background: #0F0;
    border-radius: 10px;
    box-shadow: 2px 2px 2px #999;
  }
</style>

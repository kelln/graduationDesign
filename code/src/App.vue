<template>
  <div id="app">
    <home-header></home-header>
    <router-view></router-view>
  </div>
</template>

<script>
  import Header from './components/Head'
  import Foot from './components/Footer.vue'
  import Test from './components/test.vue'

  export default {
    name: 'app',
    components: {
      'home-header': Header,
      'home-footer': Foot,
      'test': Test
    },
    methods: {
      haha(id) {
        console.log(this.$route.query.id);
      }
    }
}

</script>

<style scoped>
  body {
    min-width: 955px;
  }
  .box {
    width: 200px;
    height: 100px;
    background: #0F0;
    border-radius: 10px;
    box-shadow: 2px 2px 2px #999;
  }
  .clock-box {
    position: fixed;
    left: 10px;
    top: 10%;
  }

  .content {
    width: 100% !important;
  }
</style>


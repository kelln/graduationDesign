<template>
  <el-menu theme="#EFF2F7" class="el-menu-demo" mode="horizontal">
  <el-menu-item index="1"><router-link to="/">首页</router-link></el-menu-item>
  <el-submenu index="2">
    <template slot="title">我的管理台</template>
    <el-menu-item index="2-1">选项1</el-menu-item>
    <el-menu-item index="2-2">选项2</el-menu-item>
    <el-menu-item index="2-3">选项3</el-menu-item>
  </el-submenu>
  <el-menu-item index="3"><a href="https://www.keeln.com" target="_blank">更多</a></el-menu-item>
  <div class="login-register">
    <el-menu-item index="4"><router-link to="/login">登录</router-link></el-menu-item>
  </div>
</el-menu>
</template>

<script>
  export default {

  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .login-register {
    font-size: .6em;
    float: right;
  }
</style>

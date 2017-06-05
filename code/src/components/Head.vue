<template>
  <el-menu theme="#EFF2F7" class="el-menu-demo" mode="horizontal">
  <router-link to="/"><el-menu-item index="1">首页</el-menu-item></router-link>
  <el-submenu index="2">
    <template slot="title">我的管理台</template>
    <el-menu-item index="2-1"><router-link to="/test">选项1</router-link></el-menu-item>
    <el-menu-item index="2-2">选项2</el-menu-item>
    <el-menu-item index="2-3">选项3</el-menu-item>
  </el-submenu>
  <el-menu-item index="3"><a href="https://www.keeln.com" target="_blank">更多</a></el-menu-item>
  <div class="login-register">
      <el-menu-item v-if='isLogin' index="4"><router-link to="/login">登录</router-link></el-menu-item>
      <el-menu-item v-else index="4">
        <el-dropdown trigger="click">
         <span class="el-dropdown-link">Jason<i class="el-icon-caret-bottom el-icon--right"></i></span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item class="clearfix" @click.native="logout">
              注销
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-menu-item>
      
  </div>
</el-menu>
</template>

<script>
  export default {
    data() {
      return {
        'isLogin': false,
      }
    },
    methods: {
      logout() {
        this.$router.push('/login');
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .login-register {
    font-size: .6em;
    float: right;
  }
</style>

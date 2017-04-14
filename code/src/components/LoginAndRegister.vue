<template>
    <div class="login-register">
        <div class="header">
            <h1>{{ welMsg }}</h1>
        </div>
        <div class="method">
            <template>
                <el-tabs @tab-click="show">
                    <el-tab-pane label="登录"></el-tab-pane>
                    <el-tab-pane label="注册"></el-tab-pane>
                </el-tabs>
            </template>
        </div>
        <div class="login" v-if="isShow">
            <el-input label="username" placeholder="Please enter username" v-model="usernameInput">
                <template slot="prepend">{{ username }}</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="Please enter password" v-model="passwdInput">
                <template slot="prepend">{{ passwd }}</template>
            </el-input>
            <el-button type="primary" @click="checkLogin">登录</el-button>
            <p class="forget-passwd">忘记密码</p>
        </div>
        <div class="register" v-if="!isShow">
            <el-input label="username" placeholder="Please enter username" v-model="rUsename">
                <template slot="prepend">{{ username }}</template>
            </el-input>
            <el-input label="passwd" placeholder="Please enter nickname" v-model="rNickname">
                <template slot="prepend">Nickname</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="Please enter password" v-model="rPasswd">
                <template slot="prepend">{{ passwd }}</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="Please verify password" v-model="ryPasswd">
                <template slot="prepend">Verify</template>
            </el-input>
            <el-select placeholder="职位" v-model="rPosition">
                <el-option value="1" label="教师"></el-option>
                <el-option value="2" label="学生"></el-option>
                <el-option value="3" label="小学生"></el-option>
            </el-select>
            <el-button type="primary" @click="checkRegister">注册</el-button>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                welMsg: 'Welcome To Login In',
                username: 'Username',
                passwd: 'Password',
                isShow: true,
                usernameInput: '',
                passwdInput: '',
                rUsename: '',
                rNickname: '',
                rPasswd: '',
                ryPasswd: '',
                rPosition: ''
            }
        },
        methods: {
            show: function(tab) {
                if (tab.index == "0") {
                    this.isShow = true;
                    this.welMsg = 'Welcome To Login In'
                }
                if (tab.index == "1") {
                    this.isShow = false;
                    this.welMsg = 'Welcome To Register'
                }
            },
            open: function() {
                this.$message({
                    message: '请填写完整表格',
                    type: 'warning'
                })
            },
            checkRegister: function() {
                if (this.rUsename == '' || this.rNickname == '' || this.rPasswd == '' || this.ryPasswd == '' || this.rPosition == '') {
                    this.open()
                }
            },
            checkLogin: function() {
                if (this.usernameInput == '' || this.passwdInput == '') {
                    this.open()
                }
            }
        }
    }
</script>

<style>
    .login-register {
        font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
    }
    
    .login-register .header {
        width: 400px;
        text-align: center;
        margin: 2% auto;
        color: #999;
    }
    
    .login-register .login,
    .login-register .method,
    .login-register .register {
        width: 300px;
        text-align: center;
        margin: 10px auto;
    }
    
    .login-register .method {
        margin-top: 3%;
    }
    
    .el-input {
        margin: 15px 0;
    }
    
    .el-input .el-input-group__prepend {
        width: 100px;
        color: #999;
        font-weight: 600;
    }
    
    div.el-tabs__nav {
        float: none;
        margin: 0 auto;
    }
    
    div.el-tabs__active-bar {
        left: 50%;
        margin-left: -60px;
    }
    
    .el-button {
        margin-top: 20px;
        font-size: 1.1em;
        text-align: center;
        width: 250px;
        letter-spacing: 5px;
    }
    
    .forget-passwd {
        float: right;
        font-size: 0.8em;
        color: #CCC;
        cursor: pointer;
    }
    
    .forget-passwd:hover {
        color: #4893E8;
    }
</style>
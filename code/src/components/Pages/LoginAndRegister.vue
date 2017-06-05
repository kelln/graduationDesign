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
            <el-input label="username" placeholder="请输入用户名" v-model="usernameInput">
                <template slot="prepend">{{ username }}</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="请输入用户密码" v-model="passwdInput">
                <template slot="prepend">{{ passwd }}</template>
            </el-input>
            <el-button type="primary" @click="checkLogin">登录</el-button>
            <p class="forget-passwd">忘记密码</p>
        </div>
        <div class="register" v-if="!isShow">
            <el-input label="username" placeholder="请输入用户名" v-model="rUsename">
                <template slot="prepend">{{ username }}</template>
            </el-input>
            <el-input label="passwd" placeholder="请输入用户昵称" v-model="rNickname">
                <template slot="prepend">用户昵称</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="请输入用户密码" v-model="rPasswd">
                <template slot="prepend">{{ passwd }}</template>
            </el-input>
            <el-input type="password" label="passwd" placeholder="请确认用户密码" v-model="ryPasswd">
                <template slot="prepend">确认密码</template>
            </el-input>
            <el-select placeholder="性别" v-model="gender">
                <el-option value="0" label="男"></el-option>
                <el-option value="1" label="女"></el-option>
            </el-select>
            <el-button type="primary" @click="checkRegister">注册</el-button>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                welMsg: '欢 迎 登 录',
                username: '用户名',
                passwd: '密码',
                isShow: true,
                usernameInput: '',
                passwdInput: '',
                rUsename: '',
                rNickname: '',
                rPasswd: '',
                ryPasswd: '',
                gender: ''
            }
        },
        methods: {
            show: function(tab) {
                if (tab.index == "0") {
                    this.isShow = true;
                    this.welMsg = '欢 迎 登 录'
                }
                if (tab.index == "1") {
                    this.isShow = false;
                    this.welMsg = '欢 迎 注 册'
                }
            },
            open: function(Type, msg) {
                this.$message({
                    message: msg,
                    type: Type
                })
            },
            checkRegister: function() {
                if (this.rUsename == '' || this.rNickname == '' || this.rPasswd == '' || this.ryPasswd == '' || this.gender == '') {
                    this.open('warning','请填写完整表格')
                } else {
                    var that = this;
                    var para = 'rUsename='+this.rUsename+'&rPasswd='+this.rPasswd+'&rNickname='+this.rNickname+'&gender='+this.gender };
                    fetch( 'http://localhost:8088/user/userRegister.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: para,
                        mode: 'cros',
                     }).then(function(res) {
                        if (res.ok) {
                            res.json().then(function(data) {
                                if (data.code == 1) {
                                    that.open('success', '注册成功');
                                    // setTimeout(function() {
                                    //     console.log(document.getElementsByClassName("el-tabs__item"));
                                    //     document.getElementsByClassName("el-tabs__item").click();
                                    // }, 2000)
                                } else {
                                    that.open('warning', '注册失败，用户名已被注册');
                                }
                            })
                        }
                     })
                
            },
            checkLogin: function() {
                if (this.usernameInput == '' || this.passwdInput == '') {
                    this.open('warning','请填写用户名和密码')
                } else { 
                    var that = this;
                    // var paraa = { "usernameInput": this.usernameInput, "passwdInput": this.passwdInput }
                    var para = "usernameInput="+this.usernameInput+"&passwdInput="+this.passwdInput;
                   fetch('http://localhost:8088/user/userLogin.do', {
                        method: 'POST',
                        headers: {
                              'Content-Type': 'application/x-www-form-urlencoded',
                        }, 
                        mode: "cors",
                        body: para,
                        }).then(function(res) {
                          if (res.ok) {
                            res.json().then(function(data) {
                              if (data.code == 1) {
                                that.open('success','登录成功');
                                sessionStorage.setItem('userId', data.data);
                                sessionStorage.setItem('userName', that.usernameInput);
                                that.$router.push('/');
                              } else {
                                that.open('warning','用户名或密码错误');
                              }
                            });
                          } else {
                            console.log("Looks like the response wasn't perfect, got status", res.status);
                          }
                        }, function(e) {
                          console.log("Fetch failed!", e);
                        });
                    // if (this.usernameInput == 'admin' && this.passwdInput == 'admin' ) {
                    //     this.open('success','登录成功');
                    //     this.$router.push('/');
                    // } else {
                    //     this.open('error','用户名或密码错误');
                    // }
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
// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import App from './App'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'
import LoginAndRegister from './components/LoginAndRegister'

Vue.use(ElementUI)
Vue.use(Vuex)
Vue.use(VueRouter)

Vue.config.productionTip = false

const components = {
	LoginAndRegister
}

const Login = { template: LoginAndRegister }

const routes = [
	{ path: '/', component: function(resolve) { require(['./components/HomePage.vue'], resolve) }, name: 'homePage' },
	{ path: '/login', component: function(resolve) { require(['./components/LoginAndRegister.vue'], resolve) }, name: 'login' }

]

const router = new VueRouter({
  routes
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: x => x(App),
  router,
  components
})

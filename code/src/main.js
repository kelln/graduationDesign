// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import Axios from 'axios' 
import App from './App'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'
import * as conf from './datas/data.js'

console.log(conf.tourData);
Vue.use(ElementUI)
Vue.use(Vuex)
Vue.use(VueRouter)

Vue.config.productionTip = false
Vue.prototype.$ajax = Axios

const routes = [
	{ path: '/', component: function(resolve) { require(['./components/Pages/HomePage.vue'], resolve) }, name: 'homePage' },
	{ path: '/login', component: function(resolve) { require(['./components/Pages/LoginAndRegister.vue'], resolve) }, name: 'login' },
	{ path: '/test', component: function(resolve) { require(['./components/test.vue'], resolve) }, name: 'test' },
	{ path: '/viewdetial', component: function(resolve) { require(['./components/Pages/viewDetailPage.vue'], resolve) }, name: 'detialPage' },
]

const router = new VueRouter({
  routes
})

// const store = new Vuex({
	
// })

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  // store,
  render: x => x(App),

})

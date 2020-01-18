import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(ElementUI);//使用elementui组键
Vue.config.productionTip = false
Vue.prototype.$http = axios
axios.defaults.timeout = 5000 // 请求超时
axios.defaults.baseURL = 'http://115.29.67.175/:8000'
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
}).$mount('#app')

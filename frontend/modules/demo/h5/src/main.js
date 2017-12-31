// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import VueResource from 'vue-resource'
import router from './router'
import { ajaxApiDomain } from './config/domain'

Vue.config.productionTip = false

Vue.use(VueResource)
Vue.http.options.root = `${ajaxApiDomain}/`
Vue.http.options.xhr = { withCredentials: true }

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})

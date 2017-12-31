import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/demo/pc/src/components/HelloWorld'
import Poster from '@/demo/pc/src/components/Poster'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/poster',
      name: 'Poster',
      component: Poster
    }
  ]
})

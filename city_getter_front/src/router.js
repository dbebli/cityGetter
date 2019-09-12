import Vue from 'vue'
import Router from 'vue-router'
import ville from './components/ville.vue'
import admin from './components/admin.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'ville',
      component: ville
    },
    {
      path: '/admin',
      name: 'admin',
      component: admin
    }
  ]
})
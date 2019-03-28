import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
import DemoForm from './components/DemoForm.vue'
import Report from './components/Report.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/DemoForm',
      name: 'DemoForm',
      component: DemoForm
    },
    {
      path: '/Report',
      name: 'Report',
      component: Report
    }

  ]
})

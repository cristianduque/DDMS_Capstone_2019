import Vue from 'vue'
import App from './App.vue'
import router from './router'
import 'chart.js'
import 'hchs-vue-charts'
//import VueCharts from 'vue-chartjs'
//import { Bar, Line } from 'vue-chartjs'

Vue.config.productionTip = false
Vue.use(window.VueCharts)

new Vue({
   router,
  render: h => h(App),
}).$mount('#app')

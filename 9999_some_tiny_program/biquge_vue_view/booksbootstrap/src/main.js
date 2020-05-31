import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
// 下面这两行是vue3.0新增的，如果没有无法使用3.0的新属性方法，比如setup
import VueCompositionApi from '@vue/composition-api';

Vue.use(VueCompositionApi);

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");

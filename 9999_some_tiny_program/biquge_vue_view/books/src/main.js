import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VueCompositionApi from "@vue/composition-api"; // 不导入这个无法使用vue3.0新特性
import { BootstrapVue, BootstrapVueIcons } from "bootstrap-vue";

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);

Vue.use(VueCompositionApi);
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");

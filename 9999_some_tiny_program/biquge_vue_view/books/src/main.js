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

// router.beforeEach((to, from, next) => {

//   // /* 路由发生变化修改页面title */
//   if (to.meta.title) {
//     document.title = to.meta.title;
//   }

//   /* 路由发生变化修改页面meta */
//   console.log("main.js ============", to.meta.content)
//   if(to.meta.content){
//     let head = document.getElementsByTagName('head');
//     let meta = document.createElement('meta');
//     document.querySelector('meta[name="keywords"]').setAttribute('content', to.meta.content.keywords)
//     document.querySelector('meta[name="description"]').setAttribute('content', to.meta.content.description)
//     meta.content = to.meta.content;
//     head[0].appendChild(meta)
//   }

//   next()
// });

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");

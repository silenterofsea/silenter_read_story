import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Xuanhuan from "../views/Xuanhuan.vue";
import BookIndex from "../views/BookIndex.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/book/:bookindex",
    name: "BookIndex",
    component: BookIndex
  },
  {
    path: "/:cate",
    name: "Xuanhuan",
    component: Xuanhuan
  }
  // {
  //   path: "/about",
  //   name: "About",
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () =>
  //     import(/* webpackChunkName: "about" */ "../views/About.vue")
  // }
];

const router = new VueRouter({
  routes
});

export default router;

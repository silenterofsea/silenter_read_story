import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import HomeCate from "../views/HomeCate.vue";
import BookIndex from "../views/BookIndex.vue";
import BookDetail from "../views/BookDetail.vue";
import BookSearch from "../views/BookSearch.vue";
import Blank from "../views/Blank.vue";

Vue.use(VueRouter);

const routes = [
  // 网站首页路径
  {
    path: "/",
    name: "Home",
    component: Home
  },

  // 图书搜索页面
  {
    path: "/search",
    name: "BookSearch",
    component: BookSearch
  },

  {
    path: "/blank",
    name: "Blank",
    component: Blank
  },

  // 网站分类路径
  {
    path: "/:cate",
    name: "HomeCate",
    component: HomeCate
  },

  // 图书首页路径
  {
    path: "/book/:book_id",
    name: "BookIndex",
    component: BookIndex
  },

  // 图书详情页路径
  {
    path: "/book/:book_id/:cap_id",
    name: "BookDetail",
    component: BookDetail
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
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

// router.beforeEach((to, from, next) => {

//   // Change doc title

//   document.title = to.meta.keywords || 'Unknow title';
//   document.keywords = to.meta.keywords;

//   // document.querySelector('meta[name="keywords"]').setAttribute('content', to.meta.keywords)

//   // document.querySelector('meta[name="description"]').setAttribute('content', to.meta.description)

// })

export default router;

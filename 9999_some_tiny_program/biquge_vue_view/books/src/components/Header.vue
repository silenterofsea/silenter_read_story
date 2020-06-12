<template>
  <b-container id="Header">
    <b-navbar toggleable="lg" type="dark" variant="info">
      <b-navbar-brand href="#">嗨小说</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item
            v-for="item in cates.cates"
            :key="item.id"
            :href="item.url"
            :class="item.url == now_url ? 'active' : ''"
          >
            <!-- <router-link :to="item.url">{{ item.text }}</router-link> -->
            {{ item.text }}
          </b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <!-- <b-nav-form :model="searchForm" ref="searchForm" @submit="onSearch">
                <b-form-input  size="sm" class="mr-sm-2" v-model="searchForm.key"  placeholder="输入：书名或者作者"></b-form-input>
                <b-button size="sm" class="my-2 my-sm-0" type="submit">查询--{{ searchForm.key }}</b-button>
              </b-nav-form> -->

          <li class="form-inline">
            <div class="form-inline">
              <input
                v-model="searchForm.key"
                type="text"
                placeholder="输入：书名或者作者"
                class="mr-sm-2 form-control form-control-sm"
              />
              <button
                @click="onSearch"
                type="submit"
                class="btn my-2 my-sm-0 btn-secondary btn-sm"
              >
                查询
              </button>
            </div>
          </li>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </b-container>
</template>

<style lang="scss" scoped>
@media (max-width: 500px) {
  #Header {
    margin-top: 90px;
  }
}
</style>

<script>
import { reactive, onMounted, ref } from "@vue/composition-api";
import { GetCates } from "../apis/read.js";
import { GetInfoPOST } from "../apis/read.js";
import { stripscript } from "../apis/validate.js";

export default {
  name: "Header",

  setup(props, context) {
    const now_url = ref(context.root.$route.path);
    const cates = reactive({
      cates: []
    });
    GetCates().then(reponse => {
      console.log("Home.vue: GetCates: reponse = ", reponse.data.data);
      cates.cates = reponse.data.data;
    });

    onMounted(() => {
      console.log("searchForm.key = ", searchForm.key);
    });

    const searchForm = reactive({
      // 更多得想预先设计好了一个容器，去接纳来自当前页面的数据
      key: ""
    });

    const onSearch = () => {
      alert(searchForm.key);
      // const searchParam = reactive({
      //   "url": "/search",
      //   "key": searchForm.key
      // });

      // const searchResult = reactive({
      //     "result":{}
      // });
      // alert(searchParam.key);
      // GetInfoPOST(searchParam).then((resp)=>{
      //     console.log("search data.data==============", resp.data.data);
      //     searchResult.result = resp.data.data
      // });

      // context.root.$router.push('/search', searchResult);
      // context.root.$router.push({name:"BookSearch",params:{data:searchResult.result}})

      // context.root.$router.push({path:"/search",query:{q:searchForm.key}})
      // context.root.$router.push('/search?q='+searchForm.key);

      // window.location.href="/search?q="+searchForm.key;
      if (stripscript(searchForm.key) == true && searchForm.key != "") {
        // alert("执行成功");
        // context.root.$router.replace('/search?q='+searchForm.key);
        context.root.$router.push({
          path: "/blank",
          query: {
            q: searchForm.key
          }
        });
      } else {
        alert("请输入准确的图书名称，或者作者名称哦");
      }
    };

    return {
      cates,
      now_url,
      searchForm,

      onSearch
    };
  }
};
</script>

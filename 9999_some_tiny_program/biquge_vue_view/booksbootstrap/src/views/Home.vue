<template>
<div id="Home">
  <b-container >
    <b-navbar toggleable="lg" type="dark" variant="info">
        <b-navbar-brand href="#">嗨小说</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
          <b-nav-item  v-for="(item, index) in cates.navList" v-bind:key="index"  @click="clickcate(item.url)">{{ item.text }}</b-nav-item>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">
            <b-nav-form>
              <b-form-input size="sm" class="mr-sm-2" placeholder="书名或者作者"></b-form-input>
              <b-button size="sm" class="my-2 my-sm-0" type="submit">查询</b-button>
            </b-nav-form>

          </b-navbar-nav>
        </b-collapse>
      </b-navbar>

  </b-container>
    

  {{ now_url }}
  <div v-if="now_tag === '/'"><WebIndex  :fromHomeData="newestItem"  /></div><!-- 全站首页模板 -->
  <div v-else-if="now_tag === 'cate'"><Cate  :fromHomeData="newestItem" v-on:getbookinfos="GetBookInfos"/></div><!-- 全站分类模板 -->
  <div v-else-if="now_tag === 'bookIndex'"><BookIndex  :fromHomeData="bookItem" /></div><!-- 图书首页模板 -->
  <div v-else> error</div>






    
    <Footer />
    <!-- footer -->



</div>
</template>

<script>
import {reactive, onMounted, ref} from "@vue/composition-api";
import {GetCate} from "../apis/read.js";
import Footer from "../components/Footer.vue";
import Cate from "../components/Cate.vue";
import WebIndex from "../components/WebIndex.vue";
import BookIndex from "../components/BookIndex.vue";
import { GetInfo } from "../apis/read.js";

export default {
  name: "Home",
  components: {
    Footer,
    Cate,
    WebIndex,
    BookIndex
  },
  setup(props, context){
    // 当前页面的url
    const now_url = ref('/');
    const now_tag = ref('/');

    // 初始化nav中所需要的数据
    const cates = reactive({"navList": []});
    // 给nav中的数据复制
    GetCate().then(function (response) {
      // handle success
      console.log("in GetCate: response = ", response);
      console.log("in GetCate: response.data.data = ", response.data.data);
      cates.navList = response.data.data
      
    });

    const newestParms = reactive({
            "url": '',
            "data": {
                "key":"newest"
            }
        });

    const mostParms = reactive({
            "url": '',
            "data": {
                "key":"most"
            }
        });

    const newestItem = reactive({
            "newestItems":[],
            "mostItems":[]
        });

    // 首页的其他信息并没有赋值，稍后处理
    
    
    // 初始化分类页中的信息

    // nav的绑定事件，如果正确会返回结果显示在页面上
    const clickcate = ((url) => {
      newestParms.url = url;
      now_url.value = url;
      now_tag.value = 'cate'
      console.log("in Header.vue clickcate clicked ! url = ", url);
      console.log("in Header.vue clickcate clicked ! ");
      GetInfo(newestParms).then((response)=>{
                console.log("11111111111111111111111111111111111111 = ", response.data.data);
                newestItem.newestItems = response.data.data;
        });

      mostParms.url = url;
      GetInfo(mostParms).then((response)=>{
                console.log("11111111111111111111111111111111111111 = ", response.data.data);
                newestItem.mostItems = response.data.data;
        });
    });

    const bookInfosParams = reactive({
      "url": '',
      "data":{
        "key":"infos"
      }
    });

    const bookCapsParams = reactive({
      "url": '',
      "data":{
        "key":"caps"
      }
    });

    const bookItem = reactive({
            "bookinfosItems":[],
            "bookcapsItems":[]
        });

    const GetBookInfos = ((url)=>{
      bookInfosParams.url = url;
      bookCapsParams.url = url;
      now_tag.value = 'bookIndex';
      console.log("我在子组件中调用父组件的函数成功了！！！！！！！！！！！！！！！ url = ", url);
      GetInfo(bookInfosParams).then((response)=>{
                console.log("我在子组件中调用父组件的函数成功了！！！！！！！！！！！！！！！ = ", response.data.data);
                bookItem.bookinfosItems = response.data.data;
        });
      GetInfo(bookCapsParams).then((response)=>{
                console.log("我在子组件中调用父组件的函数成功了！！！！！！！！！！！！！！！ = ", response.data.data);
                bookItem.bookcapsItems = response.data.data;
        });
    })

    onMounted(()=>{
            
            console.log("in Xuanhuan.vue url = ", context.root.$route.path);
        });

    return {
        cates,
        now_url,
        newestItem,
        now_tag,
        bookItem,


        clickcate,
        GetBookInfos
    }
  }
};
</script>

<style lang="scss" scoped>
#container-all{
  height: 100vh;
}

#footer{
  text-align: center;
}

</style>

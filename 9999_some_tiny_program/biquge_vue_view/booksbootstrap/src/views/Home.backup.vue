<template>
<div id="Home">
  <b-container >
  <b-navbar toggleable="lg" type="dark" variant="info">
      <b-navbar-brand href="#">嗨小说</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <!-- <li v-for="(item, index) in menuTab" :class="{'current':item.current}" v-bind:key="menuTab.id" @click="toggleMenu(item)">{{ item.txt }}:{{ index }}</li> -->
          <b-nav-item  v-for="(item, index) in cates.navList" v-bind:key="index"  @click="clickcate(item.url)">{{ item.text }}</b-nav-item>
          <!-- <b-nav-item href="#" >Link0</b-nav-item>
          <b-nav-item href="#" >Link1</b-nav-item>
          <b-nav-item href="#" class="active">Link2</b-nav-item>
          <b-nav-item href="#" >Link3</b-nav-item>
          <b-nav-item href="#" >Link4</b-nav-item>
          <b-nav-item href="#" >Link5</b-nav-item>
          <b-nav-item href="#" >Link6</b-nav-item>
          <b-nav-item href="#" >Link7</b-nav-item>
          <b-nav-item href="#" >Link8</b-nav-item> -->
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
    
<b-container >
  {{ now_url }}
  <div v-if="now_url === '/'"><WebIndex  :fromHomeData="now_url" /></div>
  <div v-else-if="now_url === '/xuanhuan'"><Cate  :fromHomeData="now_url"/></div>
  <div v-else-if="now_url === '/xiuzhen'"><Cate :fromHomeData="now_url"/></div>
  <div v-else> error</div>

</b-container>




    
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

export default {
  name: "Home",
  components: {
    Footer,
    Cate,
    WebIndex
  },
  setup(props, context){
    // 当前页面的url
    const now_url = ref('/');

    // 初始化nav中所需要的数据
    const cates = reactive({"navList": []});
    // 给nav中的数据复制
    GetCate().then(function (response) {
      // handle success
      console.log("in GetCate: response = ", response);
      console.log("in GetCate: response.data.data = ", response.data.data);
      cates.navList = response.data.data
      
    });

    // 首页的其他信息并没有赋值，稍后处理
    
    
    // 初始化分类页中的信息

    // nav的绑定事件，如果正确会返回结果显示在页面上
    const clickcate = ((url) => {
      now_url.value = url;
      console.log("in Header.vue clickcate clicked ! url = ", url);
      console.log("in Header.vue clickcate clicked ! ");
    });

    onMounted(()=>{
            
            console.log("in Xuanhuan.vue url = ", context.root.$route.path);
        });

    return {
        cates,
        now_url,


        clickcate
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

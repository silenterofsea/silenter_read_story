<template>
    <b-navbar toggleable="lg" type="dark" variant="info" id="Header">
      <b-navbar-brand href="#">嗨小说</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <!-- <b-nav-item  v-for="(item, index) in cates.navList" v-bind:key="index" :href="item.url" @click="clickcate(item.url)" >{{ item.text }}</b-nav-item> -->
          <b-nav-item  v-for="(item, index) in cates.navList" v-bind:key="index" :href="'#'+item.url" >{{ item.text }}</b-nav-item>

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
</template>

<script>
import {reactive} from "@vue/composition-api";
import {GetCate} from "../apis/read.js"

export default {
  name: "Header",
  components: {
    
  },
  setup(props, context){
    const cates = reactive({"navList": []});
    GetCate().then(function (response) {
      // handle success
      console.log("in GetCate: response = ", response);
      console.log("in GetCate: response.data.data = ", response.data.data);
      cates.navList = response.data.data
      
    });

    return {
        cates
    }
  }
};
</script>

<style lang="scss" scoped>

</style>


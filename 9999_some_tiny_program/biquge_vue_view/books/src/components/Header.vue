<template>
      <b-container >
        <b-navbar toggleable="lg" type="dark" variant="info">
          <b-navbar-brand href="#">嗨小说</b-navbar-brand>

          <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

          <b-collapse id="nav-collapse" is-nav>
            <b-navbar-nav>
              <b-nav-item  v-for="(item) in cates.cates" :key="item.id" :href="item.url"  :class="item.url == now_url ?'active':''">
                <!-- <router-link :to="item.url">{{ item.text }}</router-link> -->
                {{ item.text }}
                </b-nav-item>
            </b-navbar-nav>

            <!-- Right aligned nav items -->
            <b-navbar-nav class="ml-auto">
              <b-nav-form>
                <b-form-input size="sm" class="mr-sm-2" placeholder="输入：书名或者作者"></b-form-input>
                <b-button size="sm" class="my-2 my-sm-0" type="submit">查询</b-button>
              </b-nav-form>
            </b-navbar-nav>
          </b-collapse>
        </b-navbar>
    </b-container>
</template>

<style lang="scss" scoped>

</style>

<script>

import { reactive, onMounted,ref } from "@vue/composition-api";
import { GetCates } from "../apis/read.js";


export default {
    name: "Header",

    setup(props,context){
        const now_url = ref(context.root.$route.path)
        const cates = reactive({
        "cates":[]
        });
        GetCates().then((reponse)=>{
            console.log("Home.vue: GetCates: reponse = ", reponse.data.data)
            cates.cates = reponse.data.data
        });


    onMounted(()=>{
        console.log("context.root.$route.path = ", now_url)
    });

        return {
        cates,
        now_url
        }
    }
}
</script>
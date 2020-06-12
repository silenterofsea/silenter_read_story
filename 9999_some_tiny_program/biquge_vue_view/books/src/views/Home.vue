<template>
  <div id="Home">
    <Header />

    <Ads />

    <b-container>
      <b-row style="height:1000px">
        <b-col>1 of 3</b-col>
        <b-col>2 of 3</b-col>
        <b-col>3 of 3</b-col>
      </b-row>
    </b-container>

    <Footer />
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import Ads from "../components/Ads.vue";
import { onMounted, ref, reactive } from "@vue/composition-api";
import { GetInfoPOST } from "../apis/read.js";
import { rasEncrypt } from "../utils/rsa.js";

export default {
  name: "Home",
  components: {
    Header,
    Footer,
    Ads
  },

  setup(props, context) {
    

    // document.title = content.title;
    // document.querySelector('meta[name="keywords"]').setAttribute('content', content.keywords);
    // document.querySelector('meta[name="description"]').setAttribute('content', content.description);

    onMounted(() => {

      console.log("Home meta = ", context.root.$route.meta);
      const contentParams = reactive({
        url: "/content",
        key: "home"
      });

      GetInfoPOST(contentParams).then(resp => {
        console.log(resp.data.data);
        document.title = resp.data.data.title;
        document.querySelector('meta[name="keywords"]').setAttribute("content", resp.data.data.keywords);
        document.querySelector('meta[name="description"]').setAttribute("content", resp.data.data.description);
      });
    });

    return {};
  }
};
</script>

<style lang="scss" scoped></style>

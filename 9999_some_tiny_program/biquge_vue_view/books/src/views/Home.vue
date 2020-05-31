<template>
<div id="Home"> 

    <Header />

    <Ads />

    <b-container >
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


export default {
  name: "Home",
  components: {
    Header,
    Footer,
    Ads
  }
};
</script>

<style lang="scss" scoped>

</style>

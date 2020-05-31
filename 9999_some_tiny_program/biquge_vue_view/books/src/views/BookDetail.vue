<template>
    <div id="BookDetail">
        <Header />

        <Ads />
        <b-container>
            



        <b-row>
            BookDetail
        </b-row>
        </b-container>
        <Footer />
    </div>
</template>

<style lang="scss" scoped>

</style>

<script>
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import Ads from "../components/Ads.vue";

export default {
    name: "BookDetail",
    components:{
        Header,
        Footer,
        Ads
    }
}
</script>
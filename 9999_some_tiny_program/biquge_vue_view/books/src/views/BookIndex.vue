<template>
    <div id="BookIndex">
        <Header />

        <Ads />

        <b-container>
            <b-row>
                <!-- 图书基本信息 -->
                <b-col cols="12" md="4">
                    <a :href="'/book/'+ bookinfos.indexInfos.book_id ">
                        <b-img thumbnail fluid :src="bookinfos.indexInfos.image_urls" class="p-3" style="width:80%; margin-left:10%;"  :alt="'小说：'+bookinfos.indexInfos.book_name"></b-img>
                    </a>
                </b-col>
                <b-col cols="12" md="8">
                    <b-jumbotron header-level="0" header-tag="h5" style="padding:3rem 1rem">
                        <template v-slot:header>{{ bookinfos.indexInfos.book_name }}</template>

                        
                        <div class="mb-3">作者：{{ bookinfos.indexInfos.book_author }}</div>
                        <div class="mb-3"><a :href="'/book/'+bookinfos.indexInfos.book_id+'/'+bookinfos.indexInfos.book_newest_url">最新章节：{{ bookinfos.indexInfos.book_newest_name }}</a></div>
                        <div class="mb-3">最近更新时间：{{ dateFormat(bookinfos.indexInfos.book_last_update_time) }}</div>
                        <div class="mb-3">本书状态：{{ bookinfos.indexInfos.book_status }}</div>

                        <hr>
                        
                        <p v-html="bookinfos.indexInfos.book_desc">
                            
                        </p>

                        <hr>

                       <!-- <template v-slot:lead>
                        <b-row>作者：123</b-row>
                        <b-row>最近更新：123</b-row>
                        </template>  -->

                        

                        <b-button pill variant="primary" class="left" style="float: left;margin-left:5px" href="#">开始阅读</b-button>
                        <b-button pill variant="success" class="right" style="float: right;margin-right:5px" href="#">加入收藏夹</b-button>
                    </b-jumbotron>
                </b-col>
            </b-row>

            <b-row>
                <!-- 图书最近更新的20章 -->
                {{ bookinfos.newest20caps }}
            </b-row>

            <b-row>
                <!-- 图书的所有章节 -->
                {{ bookinfos.capsInfos }}
            </b-row>


        </b-container>


        <Footer />
    </div>
</template>

<style lang="scss" scoped>
// h3{
//     font-size: 16px;
// }
</style>

<script>
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import Ads from "../components/Ads.vue";
import { ref, onMounted, reactive } from "@vue/composition-api";
import { GetInfoPOST } from "../apis/read.js";
import dateFormat from "../utils/date.js";
// import addFavo from "../utils/addToBrowser.js";

export default {
    name: "BookIndex",
    components:{
        Header,
        Footer,
        Ads
    },

    setup(props, context){
        const now_url = ref(context.root.$route.path);

        // const indexInfos = ref(null);
        // const capsInfos = ref(null); 这种写法会报错

        const bookinfos = reactive({
            "indexInfos":{},
            "capsInfos":{},
            "newest20caps":{}
        })

        const indexParams = reactive({
            "url": now_url.value,
            "key":"bookindex"
        });

        const capsParams = reactive({
            "url": now_url.value,
            "key":"bookcaps"
        });

        const newest20capsParams = reactive({
            "url": now_url.value,
            "key":"newest20caps"
        });

        GetInfoPOST(indexParams).then((response)=>{
            // indexInfos.value = response.data.data;
            bookinfos.indexInfos = response.data.data;
        });

        GetInfoPOST(capsParams).then((response)=>{
            // capsInfos.value = response.data.data;
            bookinfos.capsInfos = response.data.data;
        });

        GetInfoPOST(newest20capsParams).then((response)=>{
            // capsInfos.value = response.data.data;
            bookinfos.newest20caps = response.data.data;
        });

        onMounted(()=>{
            console.log("BookIndex.vue: now_url = ", now_url.value)
        });

        return {
            // data
            bookinfos,

            // function
            // addFavo
            dateFormat
        }
    }
}
</script>
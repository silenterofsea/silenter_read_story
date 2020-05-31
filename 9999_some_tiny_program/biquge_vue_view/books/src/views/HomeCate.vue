<template>
    <div id="HomeCate">
        <Header />
        <Ads />
        <b-container>
        



        <b-row>
            <b-col id="main-left" cols="12" md="7">
                <!-- 左边部分: 最新跟新的小说 -->
                <h6>最新更新的小说</h6>
                <table role="table" aria-busy="false" aria-colcount="3" class="table b-table table-striped table-hover"><!----><!---->
                    <thead role="rowgroup"><!---->
                        <tr role="row" class="">
                            <th v-for="(item, index) in newestFields" :key="index" role="columnheader" scope="col" :aria-colindex="index" ><div>{{ item }}</div></th>
                        </tr>
                    </thead>
                    <tbody role="rowgroup"><!---->
                        <tr v-for="(item, index) in cateItems.newestItems" :key="index" role="row">
                            <!-- <td v-for="(itemTd, indexTd) in item" :key="indexTd" :aria-colindex="indexTd" role="cell" >{{ itemTd }}</td> -->
                            <td  :aria-colindex="item" role="cell" ><a :href="'/book/'+item.book_id" class="success">{{ item.book_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" ><a :href="'/book/'+ item.book_id+ '/'+ item.book_newest_url">{{ item.book_newest_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" >{{ dateFormat(item.book_last_update_time) }}</td>
                        </tr>
                    </tbody><!---->
                </table>
            </b-col>
            <b-col cols="12" md="1"></b-col>
            <b-col id="main-right" cols="12" md="4">
                <!-- 右边部分： 最多阅读的小说 -->
                <h6>最多阅读的小说</h6>
                <table role="table" aria-busy="false" aria-colcount="3" class="table b-table table-striped table-hover"><!----><!---->
                    <thead role="rowgroup"><!---->
                        <tr role="row" class="">
                            <th v-for="(item, index) in mostFields" :key="index" role="columnheader" scope="col" :aria-colindex="index" ><div>{{ item }}</div></th>
                        </tr>
                    </thead>
                    <tbody role="rowgroup"><!---->
                        <tr v-for="(item, index) in cateItems.mostItems" :key="index" role="row" >
                            <td  :aria-colindex="item" role="cell" ><a :href="'/book/'+item.book_id">{{ item.book_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" ><a :href="'/book/'+item.book_id">{{ item.book_author }}</a></td>
                        </tr>
                    </tbody><!---->
                </table>
            </b-col>
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
import { ref, reactive, onMounted} from "@vue/composition-api";
import { GetInfoPOST } from "../apis/read.js";
import dateFormat from "../utils/date.js";

export default {
    name: "HomeCate",
    components:{
        Header,
        Footer,
        Ads
    },

    setup(props, context){
        const newestFields = reactive({'book_name':'小说','book_newest_name': '最新章节', 'book_last_update_time':'更新时间'});
        const mostFields = reactive(['小说', '作者']);
        const now_url = ref(context.root.$route.path);
        const mostParams = reactive({
            "url": now_url.value,
            "key":"most"
        });


        const newestParams = reactive({
            "url": now_url.value,
            "key":"newest"
        });

        const cateItems = reactive({
            "newestItems":[],
            "mostItems":[]
        });

        

        GetInfoPOST(mostParams).then((mostReponse)=>{
            
            console.log("mostReponse = ", mostReponse.data.data);
            cateItems.mostItems = mostReponse.data.data;
        });

        GetInfoPOST(newestParams).then((newestReponse)=>{
            
            console.log("newestReponse = ", newestReponse.data.data);
            cateItems.newestItems = newestReponse.data.data
        })



        onMounted(()=>{
            console.log("mostParams = ", mostParams.key)
            console.log("newestParams = ", newestParams.key)
            console.log("HomeCate: now_url = ", now_url.value)
        });

        return {
            //data
            cateItems,
            newestFields,
            mostFields,

            //function
            dateFormat
        }
    }
}
</script>
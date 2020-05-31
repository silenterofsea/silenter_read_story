<template>
    <b-row>
        <!-- {{ fromHomeData }} -->
            <b-col id="main-left" cols="12" md="6">
                <!-- 左边部分: 最新跟新的小说 -->
                <h6>最新更新的小说:{{ fromHomeData }}</h6>
                <table role="table" aria-busy="false" aria-colcount="3" class="table b-table table-striped table-hover"><!----><!---->
                    <thead role="rowgroup"><!---->
                        <tr role="row" class="">
                            <th v-for="(item, index) in newestFields" :key="index" role="columnheader" scope="col" :aria-colindex="index" ><div>{{ item }}</div></th>
                        </tr>
                    </thead>
                    <tbody role="rowgroup"><!---->
                        <tr v-for="(item, index) in newestItem.items" :key="index" role="row" :class="item.isActive == true ? 'active': ''" >
                            <!-- <td v-for="(itemTd, indexTd) in item" :key="indexTd" :aria-colindex="indexTd" role="cell" >{{ itemTd }}</td> -->
                            <td  :aria-colindex="item" role="cell" ><a :href="'#/'+item.book_id">{{ item.book_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" ><a :href="'#/'+ item.book_id+ '/'+ item.book_newest_url">{{ item.book_newest_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" >{{ dateFormat(item.book_last_update_time) }}</td>
                        </tr>
                    </tbody><!---->
                </table>
            </b-col>
            <b-col id="main-right" cols="12" md="6">
                <!-- 右边部分： 最多阅读的小说 -->
                <h6>最多阅读的小说</h6>
                <table role="table" aria-busy="false" aria-colcount="3" class="table b-table table-striped table-hover"><!----><!---->
                    <thead role="rowgroup"><!---->
                        <tr role="row" class="">
                            <th v-for="(item, index) in mostFields" :key="index" role="columnheader" scope="col" :aria-colindex="index" ><div>{{ item }}</div></th>
                        </tr>
                    </thead>
                    <tbody role="rowgroup"><!---->
                        <tr v-for="(item, index) in newestItem.items" :key="index" role="row" :class="item.isActive == true ? 'active': ''" >
                            <td v-for="(itemTd, indexTd) in item" :key="indexTd" :aria-colindex="indexTd" role="cell" >{{ itemTd }}</td>
                        </tr>
                    </tbody><!---->
                </table>
            </b-col>
        </b-row>
</template>

<style lang="scss" scoped>

</style>

<script>
import { onMounted, reactive, onBeforeMount } from '@vue/composition-api';
import { GetInfo } from "../apis/read.js";
import dateFormat from "../utils/date.js";


export default {
    name: 'Cate',
    props: ["fromHomeData"],
    setup(props, context){
        const newestFields = reactive({'book_name':'小说','book_newest_name': '最新章节', 'book_last_update_time':'更新时间'});
        const mostFields = reactive(['小说', '最新章节', '小说状态']);
        const newestItem = reactive({
            "items":[]
        });
        const newestParms = reactive({
            "url": props.fromHomeData,
            "data": {
                "key":"newest"
            }
        });

        GetInfo(newestParms).then((response)=>{
                console.log("11111111111111111111111111111111111111 = ", props.fromHomeData);
                newestItem.items = response.data.data;
        });
        

        onBeforeMount(()=>{
            
        })

        onMounted(()=>{
            console.log("in Cate.vue: props.url props.url = ", props.fromHomeData);
        });


        return {
            newestItem,
            newestFields,
            mostFields,

            dateFormat
        }
    }
}


</script>
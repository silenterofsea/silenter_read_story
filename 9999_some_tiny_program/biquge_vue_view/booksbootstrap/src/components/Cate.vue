<template>
<b-container >
    <b-row id="cate">
        <!-- {{ fromHomeData }} -->
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
                        <tr v-for="(item, index) in fromHomeData.newestItems" :key="index" role="row" :class="item.isActive == true ? 'active': ''" >
                            <!-- <td v-for="(itemTd, indexTd) in item" :key="indexTd" :aria-colindex="indexTd" role="cell" >{{ itemTd }}</td> -->
                            <td  :aria-colindex="item" role="cell" @click="GetBookInfos('/book/'+item.book_id)">{{ item.book_name }}</td>
                            <td  :aria-colindex="item" role="cell" ><a :href="'#/book/'+ item.book_id+ '/'+ item.book_newest_url">{{ item.book_newest_name }}</a></td>
                            <td  :aria-colindex="item" role="cell" @click="GetBookInfos('/book/'+item.book_id)">{{ dateFormat(item.book_last_update_time) }}</td>
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
                        <tr v-for="(item, index) in fromHomeData.mostItems" :key="index" role="row" @click="GetBookInfos('/book/'+item.book_id)">
                            <td  :aria-colindex="item" role="cell" >{{ item.book_name }}</td>
                            <td  :aria-colindex="item" role="cell" >{{ item.book_author }}</td>
                        </tr>
                    </tbody><!---->
                </table>
            </b-col>
        </b-row>
        </b-container >
</template>

<style lang="scss" scoped>
#cate{
    font-size: 14px;
}
</style>

<script>
import { onMounted, reactive, onBeforeMount } from '@vue/composition-api';

import dateFormat from "../utils/date.js";


export default {
    name: 'Cate',
    props: ["fromHomeData"],
    setup(props, context){
        const newestFields = reactive({'book_name':'小说','book_newest_name': '最新章节', 'book_last_update_time':'更新时间'});
        const mostFields = reactive(['小说', '作者']);
        
        
        

        onBeforeMount(()=>{
            
        })

        onMounted(()=>{
            console.log("in Cate.vue: props.url props.url = ", props.fromHomeData);
        });

        const GetBookInfos = ((url)=>{
            console.log(url);
            context.emit('getbookinfos',url)
            // console.log(context.emit('getbookinfos'));
            // console.log(props);
            // context.root.$emit('GetBookInfos');
            // console.log("我想调用父组建的函数");
        })


        return {
            newestFields,
            mostFields,

            dateFormat,
            GetBookInfos
        }
    }
}


</script>
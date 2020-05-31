<template>
    <b-container id="xuanhuan">
        <Header />
        <b-row id="main-top">
            Xuanhuan.vue:上面部分(预留广告或者其他)
        </b-row>



        <b-row>
            <b-col id="main-left" cols="12" md="6">
                <!-- 左边部分: 最新跟新的小说 -->
                <h6>最新更新的小说</h6>
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

        <Footer />
        </b-container>
</template>

<script>
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import { reactive, onMounted } from '@vue/composition-api';
import {GetInfo} from "../apis/read.js";


export default {
    name: "xuanhuan",
    components: {
        Header,
        Footer
    },

    setup(props, context){
        const newestItem = reactive({
            "items":[]
        });
        const fields = reactive(['first_name', 'last_name', 'age']);
        const newestFields = reactive({'book_name':'小说','book_newest_name': '最新章节', 'book_last_update_time':'更新时间'})
        const mostFields = reactive(['小说', '最新章节', '小说状态']);
        const newestParms = reactive({
            "url": context.root.$route.path,
            "data": {
                "key":"newest"
            }
        })
        GetInfo(newestParms).then((response)=>{
            console.log("in Xuanhuan.vue:GetInfo  response.data = ", response.data);
            newestItem.items = response.data.data
            console.log("in Xuanhuan.vue:GetInfo  response.data.data = ", response.data.data);
        });

        onMounted(()=>{
            console.log("in Xuanhuan.vue url = ", context.root.$route.path)
        });

        const formatDate = ((date) => {
            let date_value = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            return date_value;
        });

        const dateFormat = ((time) => {
            var date=new Date(time);
            var year=date.getFullYear();
            /* 在日期格式中，月份是从0开始的，因此要加0
            * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
            * */
            var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
            var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
            var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
            var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
            var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
            // 拼接
            return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
	    });

        return {
            newestItem,
            newestFields,
            fields,

            // mostItem,
            mostFields,


            formatDate,
            dateFormat
            
        }
    }

}
</script>

<style lang="scss" scoped>
#main-left{
    font-size: 14px;
}

</style>
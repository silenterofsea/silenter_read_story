<template>
  <div id="BookSearch">
    <Header />

    <Ads />

    <b-container>
      <b-row>
        <b-col><h4>查询结果：</h4></b-col>
      </b-row>
      <b-row>
        <b-col>
          <div v-if="searchResult.result.length == 0">
            <h3 style="color:red">
              查询没有结果，请确认您输入的图书名字或者作者名字。
            </h3>
          </div>
          <div v-else>
            <table
              role="table"
              aria-busy="false"
              aria-colcount="3"
              class="table b-table table-striped table-hover"
            >
              <!----><!---->
              <thead role="rowgroup" class="">
                <!---->
                <tr role="row" class="">
                  <th
                    role="columnheader"
                    scope="col"
                    :aria-colindex="index"
                    v-for="(field, index) in fields"
                    :key="index"
                  >
                    <div>{{ field }}</div>
                  </th>
                </tr>
              </thead>
              <tbody role="rowgroup">
                <!---->
                <tr
                  role="row"
                  v-for="(item, index) in searchResult.result"
                  :key="index"
                >
                  <td aria-colindex="1" role="cell" class="">
                    <a :href="'/book/' + item.book_id">{{ item.book_name }}</a>
                  </td>
                  <td aria-colindex="2" role="cell" class="">
                    <a :href="'/book/' + item.book_id">{{
                      item.book_author
                    }}</a>
                  </td>
                  <td aria-colindex="3" role="cell" class="">
                    <a
                      :href="
                        '/book/' + item.book_id + '/' + item.book_newest_url
                      "
                      >{{ item.book_newest_name }}</a
                    >
                  </td>
                </tr>
              </tbody>
              <!---->
            </table>
          </div>
        </b-col>
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
import { onMounted, onBeforeUpdate } from "@vue/composition-api";
import { ref, reactive } from "@vue/composition-api";
import { GetInfoPOST } from "../apis/read.js";

export default {
  name: "BookSearch",
  components: {
    Header,
    Footer,
    Ads
  },
  setup(props, context) {
    const now_url = ref(context.root.$route.path);
    const fields = ref(["图书", "作者", "最新章节"]);
    const items = reactive([
      {
        isActive: true,
        age: 40,
        first_name: "Dickerson",
        last_name: "Macdonald"
      },
      { isActive: false, age: 21, first_name: "Larsen", last_name: "Shaw" },
      { isActive: false, age: 89, first_name: "Geneva", last_name: "Wilson" },
      { isActive: true, age: 38, first_name: "Jami", last_name: "Carney" }
    ]);

    const searchParam = reactive({
      url: "/search",
      key: context.root.$route.query.q
    });

    const searchResult = reactive({
      result: {}
    });

    GetInfoPOST(searchParam).then(resp => {
      console.log("search data.data==============", resp.data.data);
      // location.reload();
      // context.root.$route.go(0)
      searchResult.result = resp.data.data;
    });

    onMounted(() => {
      console.log("search url = ", now_url.value);
      console.log("search url = ", context.root.$route.query.q);
    });

    return {
      searchResult,
      fields,
      items
    };
  }
};
</script>

<style lang="scss" scoped></style>

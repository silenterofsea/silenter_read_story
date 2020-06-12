<template>
  <div id="BookDetail">
    <Header />

    <Ads />
    <b-container>
      <b-row id="detail-row">
        <b-col>
          <p>
            当前路径： <a href="/">首页</a>--
            <a :href="'/book/' + capsResponse.nearCapInfos.book_id">{{
              capsResponse.nearCapInfos.book_name
            }}</a
            >-- {{ detailResponse.content.detail_title }}
          </p>
        </b-col>
      </b-row>
      <!-- {{ capsResponse.nearCapInfos }} -->
      <b-row id="detail-row">
        <h3 id="title">{{ detailResponse.content.detail_title }}</h3>
      </b-row>

      <b-row id="detail-row">
        <b-col
          v-if="capsResponse.nearCapInfos.before_id == ''"
          style="text-align: center;"
          cols="4"
          md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >上一页</a
          ></b-col
        >
        <b-col v-else style="text-align: center;" cols="4" md="4"
          ><a
            :href="
              '/book/' +
                capsResponse.nearCapInfos.book_id +
                '/' +
                capsResponse.nearCapInfos.before_id
            "
            >上一页</a
          ></b-col
        >
        <b-col style="text-align: center;" cols="4" md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >返回目录</a
          ></b-col
        >
        <b-col
          v-if="capsResponse.nearCapInfos.next_id == ''"
          style="text-align: center;"
          cols="4"
          md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >下一页</a
          ></b-col
        >
        <b-col v-else style="text-align: center;" cols="4" md="4"
          ><a
            :href="
              '/book/' +
                capsResponse.nearCapInfos.book_id +
                '/' +
                capsResponse.nearCapInfos.next_id
            "
            >下一页</a
          ></b-col
        >
      </b-row>

      <b-row id="detail-row">
        <b-col
          ><p
            id="content-text"
            v-html="detailResponse.content.detail_content"
          ></p
        ></b-col>
      </b-row>

      <b-row id="detail-row">
        <b-col
          v-if="capsResponse.nearCapInfos.before_id == ''"
          style="text-align: center;"
          cols="4"
          md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >上一页</a
          ></b-col
        >
        <b-col v-else style="text-align: center;" cols="4" md="4"
          ><a
            :href="
              '/book/' +
                capsResponse.nearCapInfos.book_id +
                '/' +
                capsResponse.nearCapInfos.before_id
            "
            >上一页</a
          ></b-col
        >
        <b-col style="text-align: center;" cols="4" md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >返回目录</a
          ></b-col
        >
        <b-col
          v-if="capsResponse.nearCapInfos.next_id == ''"
          style="text-align: center;"
          cols="4"
          md="4"
          ><a :href="'/book/' + capsResponse.nearCapInfos.book_id"
            >下一页</a
          ></b-col
        >
        <b-col v-else style="text-align: center;" cols="4" md="4"
          ><a
            :href="
              '/book/' +
                capsResponse.nearCapInfos.book_id +
                '/' +
                capsResponse.nearCapInfos.next_id
            "
            >下一页</a
          ></b-col
        >
      </b-row>
    </b-container>
    <DetailAds />
    <Footer />
  </div>
</template>

<style lang="scss" scoped>
#title {
  display: table;
  margin: 0 auto;
}

#detail-row {
  margin-top: 10px;
  margin-bottom: 10px;
}
#content-text {
  line-height: 50px;
  font-size: 18px;
}
</style>

<script>
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import Ads from "../components/Ads.vue";
import DetailAds from "../components/DetailAds.vue";
import { ref, reactive, onMounted } from "@vue/composition-api";
import { GetInfoPOST } from "../apis/read.js";
import { replacebr } from "../utils/replaceBr.js";

export default {
  name: "BookDetail",
  components: {
    Header,
    Footer,
    Ads,
    DetailAds
  },
  setup(props, context) {
    const now_url = ref(context.root.$route.path);

    const detailParams = reactive({
      url: now_url.value,
      key: "bookdetail"
    });

    const detailResponse = reactive({
      content: {}
    });

    GetInfoPOST(detailParams).then(resp => {
      console.log("BookDetal resp.data = ====================", resp.data.data);
      detailResponse.content = resp.data.data;
      console.log(
        "detailResponse.content.detail_content===========",
        detailResponse.content.detail_content
      );
      detailResponse.content.detail_content = detailResponse.content.detail_content
        .toString()
        .replace(/\s+|&nbsp;/gi, "<br/>");
      console.log(
        "detailResponse.content.detail_contentXXXXXXXXXXXXXXXXXXX",
        detailResponse.content.detail_content
      );
      // detailResponse.content.detail_content.replace(/\s+|&nbsp;/ig, '<br/>');
    });

    const capNextBeforeParams = reactive({
      url: now_url.value,
      key: "caps"
    });

    const capsResponse = reactive({
      nearCapInfos: {}
    });

    GetInfoPOST(capNextBeforeParams).then(resp => {
      console.log(
        "BookDetal: caps--------------------> resp.data = ",
        resp.data.data
      );
      capsResponse.nearCapInfos = resp.data.data;

      // 设置关键词开始

      const contentParams = reactive({
        url: "/content",
        key: "bookdetail"
      });

      GetInfoPOST(contentParams).then(resp => {
        console.log(resp.data.data);
        document.title =
          resp.data.data.title +
          "_" +
          capsResponse.nearCapInfos.book_name +
          "_" +
          detailResponse.content.detail_title;
        document
          .querySelector('meta[name="keywords"]')
          .setAttribute(
            "content",
            resp.data.data.keywords +
              "_" +
              capsResponse.nearCapInfos.book_name +
              "_" +
              detailResponse.content.detail_title
          );
        document
          .querySelector('meta[name="description"]')
          .setAttribute(
            "content",
            resp.data.data.description +
              "_" +
              capsResponse.nearCapInfos.book_name +
              "_" +
              detailResponse.content.detail_title
          );
      });
      // 设置关键词结束
    });

    onMounted(() => {
      console.log("BookDetal now_url = ", now_url.value);
    });

    return {
      detailResponse,
      capsResponse,

      replacebr
    };
  }
};
</script>

<template>
  <b-container>
    <div id="main-top-ads">
      <a target="_blank" href=""
        ><img id="top-img" src="https://i.loli.net/2020/06/11/MLPaI12eFsyRXck.jpg"
       
      />
       <!-- https://i.loli.net/2020/06/11/MLPaI12eFsyRXck.jpg  -->
      </a>
    </div>
    <div class="couplet_ad" id="main-left-ads">
      <a target="_blank" href=""
        ><img id="left-img" src="https://i.loli.net/2020/06/11/sDlvEWaeSxzpYgb.jpg"
      /></a>
      <a @click="ad_left">关闭</a>
    </div>

    <div class="couplet_ad" id="main-right-ads">
      <a target="_blank" href=""
        ><img id="right-img" src="https://i.loli.net/2020/06/11/sDlvEWaeSxzpYgb.jpg"
      /></a>
      <a @click="ad_right">关闭</a>
    </div>
  </b-container>
</template>

<style lang="scss" scoped>
@media (max-width: 500px) {
  /* 底部固定*/
  .couplet_ad {
    display: none;
  }
  #main-top-ads {
    position: fixed;
    bottom: auto;
    top: 0;
    // max-width: 100%;
    max-height: 100%;
    z-index: 99999;
    left: 0;
  }
}

/* 底部固定*/
.couplet_ad {
  position: fixed;
  bottom: auto;
  top: 0;
  width: 150px;
  height: 600px;
  z-index: 99999;
  margin-top: 158px;
}

.couplet_ad a {
  display: block;
  cursor: pointer;
}
#main-left-ads {
  left: 0px;
}
#main-right-ads {
  right: 0px;
}
#top-img {
  max-width: 100%;
}

#left-img {
  max-width: 150px;
}
#right-img {
  max-width: 150px;
}
</style>

<script>
import { onMounted, reactive } from "@vue/composition-api";
export default {
  name: "Ads",
  setup(props, context) {
    const ad_left = () => {
      document.getElementById("main-left-ads").style.display = "none";
    };
    const ad_right = () => {
      document.getElementById("main-right-ads").style.display = "none";
    };

    onMounted(() => {
      if (document.body.clientWidth < 400) {
        console.log("我是手机 = ", document.body.clientWidth);
        document
          .querySelector("#main-top-ads")
          .setAttribute("style", "background-color:red");
        document
          .querySelector("#main-left-ads")
          .setAttribute("style", "display:none");
        document
          .querySelector("#main-right-ads")
          .setAttribute("style", "display:none");
        // document.querySelector("row[id='main-top-ads']").setAttribute('style', 'background-color:red')
        // document.querySelector('meta[name="keywords"]').setAttribute('content', resp.data.data.keywords);
      } else {
        console.log("我是电脑 = ", document.body.clientWidth);
        document
          .querySelector("#main-top-ads")
          .setAttribute("style", "background-color:red");
        document
          .querySelector("#main-left-ads")
          .setAttribute("style", "background-color:blue");
        document
          .querySelector("#main-right-ads")
          .setAttribute("style", "background-color:silver");
        // console.log(document.querySelector("#main-top-ads"))
      }
    });

    return {
      ad_left,
      ad_right
    };
  }
};
</script>

<template> </template>

<style lang="scss" scoped></style>

<script>
export default {
  name: "Blank",

  setup(props, context) {
    // alert("在blank页面中",context.root.$route.query.q);
    context.root.$router.push({
      path: "/search",
      query: {
        q: context.root.$route.query.q
      }
    });
  }
};
</script>

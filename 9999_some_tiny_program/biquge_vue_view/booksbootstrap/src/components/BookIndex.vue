<template>
    <b-container >
        <!-- {{ fromHomeData }} -->




        <b-row class="mt-4">
            <b-col cols="12" md="4" class="mt-4">
                <!-- 左边图片部分 -->
                <b-img src="https://www.biquge.com.cn/files/article/image/41/41017/41017s.jpg" fluid alt="Responsive image"></b-img>
                </b-col>
            <b-col cols="12" md="1">
            </b-col>
            <b-col cols="12" md="7" class="mt-4">
                <!-- 右边信息部分 -->
                {{ fromHomeData }}
                </b-col>
        </b-row>
    </b-container >
</template>

<style lang="scss" scoped>

</style>

<script>
export default {
    name: 'BookIndex',
    props: ["fromHomeData"],
}
</script>
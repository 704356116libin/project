<template>
  <div class="home">
    <Banner :style="{width:'100%'}" id='banner'/>
    <div>
      <h2>展示信息</h2>
      <h4>小程序，大未来</h4>
      <el-backtop target="#banner"></el-backtop>
    </div>
    <Card/>
  </div>
</template>

<script>
/*引入轮播图组件*/
import Banner from '@/components/Banner.vue'
import Card from '@/components/home/Card.vue'
export default {
  name: 'home',
  components: {
    Banner,
    Card
  }
}
</script>

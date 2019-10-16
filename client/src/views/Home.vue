<template>
  <div class="home">
    <Header msg="Welcome to Your Vue.js App"/>
    <Banner :style="{width:'100%'}" calss='banner'/>
    <Card/>
    <ProductCard/>
    <Footer />
    <!-- <el-backtop target=".page-component__scroll .el-scrollbar__wrap"></el-backtop> -->
    
  </div>
</template>

<script>
/*引入轮播图组件*/
import Header from '@/components/Header.vue'
import Banner from '@/components/Banner.vue'
import Card from '@/components/home/Card.vue'
import ProductCard from '@/components/home/ProductCard.vue'
import Footer from '@/components/Footer.vue'
export default {
  name: 'home',
  components: {
    Banner,
    Card,
    Footer,
    ProductCard,
   
  }
}
</script>

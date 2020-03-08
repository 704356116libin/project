<template>
  <div id="banner">
    <el-carousel height="500px">
      <el-carousel-item v-for="item in urls" :key="item.id">
        <img class="small" :src="item.url" />
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
export default {
  name: "Banner",
  props: {},
  data() {
    return {
      urls: [
        {
          id: 1,
          url: "/demo_img/banner/banner1.png"
        }
      ]
    };
  },
  methods: {}
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 400px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>

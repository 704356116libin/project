<template>
  <div id="banner">
     <el-carousel height="500px">
      <el-carousel-item v-for="item in urls" :key="item.id">
        <img class="small" :src="item.url"/>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
export default {
  name: 'Banner',
  props: {
    
  },
  data() {
      return {
       urls:[
        {
          id:1,
          url:'https://xrs.ixiaochengxu.cc/2018-12-14_5c132a9a1c45f.png'
        },
        {
          id:2,
          url:'http://www.duoguan.com/d/file/slide/2019-03-05/4cca3e04be5a1d7592811dc09f50e00e.png'
        },
        {
          id:3,
          url:'http://www.duoguan.com/d/file/slide/2019-04-17/1ff3ba7a6c9c7a82e1f29aca26c0a64f.png'
        },
        {
          id:4,
          url:'https://xrs.ixiaochengxu.cc/2018-12-14_5c132a9a1c45f.png'
        }
       ]
      };
  },
  methods: {
   
  }


}
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
  
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }
</style>

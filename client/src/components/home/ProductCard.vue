<template>
  <div id="card">
    <div>
      <h2>案例展示</h2>
      <h4>每一个都用心打造</h4>
    </div>
    <el-row class="">
      <el-col :span="8" v-for="(o,index) in cards " :key="o.id" :offset="0" class="ite-product-case-card-col" >
        <el-card :body-style="{ padding: '0px'}" shadow="hover" :class="[index+1%3==0?'':'ite-product-case-card']">
          <img :src="o.url" class="product-case-image">
        </el-card>
    </el-col>
</el-row>
  </div>
</template>

<script>
export default {
  name: 'ProductCard',
  props: {
    
  },
  data() {
      return {
       cards:[
        {
          id:1,
          url:"/demo_img/card/hudong.png"
        },
        {
          id:2,
          url:"/demo_img/card/shop_cover.png"
        },
        {
          id:3,
          url:"/demo_img/card/wdy_cover.png"
        },
        {
          id:4,
          url:"/demo_img/card/yuyue_cover.png"
        },
        {
          id:5,
          url:"/demo_img/card/tongcheng_cover.png"
        },
        {
          id:6,
          url:"/demo_img/card/ct_cover.png"
        }
       ],
       currentDate:new Date(),
       style:{
         item_margin_right:'3px'
       }
      };
  },
  methods: {
   
  }


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
  .time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .product-case-image {
    width: 100%;
    height:200px;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
  .ite-product-case-card{
    margin: 0% 10% 10% 10%;
    
  }
  .ite-product-case-card-col{
    width:'33.3%';
    height:'200px';
    margin-top:20px;
  }
</style>
 
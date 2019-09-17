<template>
  <div id="card">
    <div>
      <h2>案例展示</h2>
      <h4>每一个都用心打造</h4>
    </div>
    <el-row class="">
      <el-col :span="8" v-for="(o,index) in cards " :key="o.id" :offset="0" :style="{width:'33.3%',height:'200px'}" >
        <el-card :body-style="{ padding: '0px'}" shadow="hover" :class="[index+1%3==0?'':'ite-card']">
          <img :src="o.url" class="product-image">
          <div class="card-text">
            <span>好吃的汉堡</span>
          </div>
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
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
        },
        {
          id:2,
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
        },
        {
          id:3,
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
        },
        {
          id:4,
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
        },
        {
          id:5,
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
        },
        {
          id:6,
          url:'https://xrs.ixiaochengxu.cc/2017-09-11_59b65b9d811b5.png'
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

  .product-image {
    width: 100%;
    height:160px;
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
  .ite-card{
    margin: 0% 10% 10% 0%;
    
  }
  .el-row{
   
  }
  .card-text{
    padding-top: 5px ;
    padding-bottom: 5px;
  }
</style>
 
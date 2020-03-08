<template>
  <div id="card">
    <div>
      <h2>展示信息</h2>
      <h4>小程序，大未来</h4>
    </div>
    <el-row class="">
      <el-col :span="8" v-for="(o,index) in cards " :key="o.id" :offset="0"  >
        <el-card :body-style="{ padding: '0px'}" shadow="hover" :class="[index+1%3==0?'':'ite-card']">
          <img :src="o.url" class="image">
        </el-card>
    </el-col>
</el-row>
  </div>
</template>

<script>
export default {
  name: 'Card',
  props: {
    
  },
  data() {
      return {
       cards:[
        {
          id:1,
          url:"/demo_img/card/company.png"
        },
        {
          id:2,
          url:"/demo_img/card/hotel_cover.png"
        },
        {
          id:3,
          url:"/demo_img/card/pt_cover.png"
        },
         {
          id:4,
          url:"/demo_img/card/wdy_cover.png"
        },
        {
          id:5,
          url:"/demo_img/card/pinche_cover.png"
        },
        {
          id:6,
          url:"/demo_img/card/tongcheng_cover.png"
        },
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

  .image {
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
  .ite-card{
   margin: 0% 10% 10% 10%;
    
  }
  
</style>
 
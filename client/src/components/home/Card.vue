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
          <div style="padding: 14px;">
            <span>好吃的汉堡{{index}}</span>
            <div class="bottom clearfix">
              <time class="time">{{ currentDate }}</time>
            </div>
          </div>
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
          url:'http://img5.imgtn.bdimg.com/it/u=2403611520,809506871&fm=26&gp=0.jpg'
        },
        {
          id:2,
          url:'http://img3.imgtn.bdimg.com/it/u=2081362183,2237717106&fm=26&gp=0.jpg'
        },
        {
          id:3,
          url:'http://img3.imgtn.bdimg.com/it/u=3257426817,610723722&fm=26&gp=0.jpg'
        },
        {
          id:4,
          url:'http://img3.imgtn.bdimg.com/it/u=3257426817,610723722&fm=26&gp=0.jpg'
        },
        {
          id:5,
          url:'http://img5.imgtn.bdimg.com/it/u=2403611520,809506871&fm=26&gp=0.jpg'
        },
        {
          id:6,
          url:'http://img3.imgtn.bdimg.com/it/u=2081362183,2237717106&fm=26&gp=0.jpg'
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

  .image {
    width: 100%;
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
    margin: 5%;
    
  }
  .el-row{
    margin: 2% 5% 0 5%; 
  }
</style>
 
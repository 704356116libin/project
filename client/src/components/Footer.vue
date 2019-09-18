<template>
  <div id="footer" class="footer">
    <el-row :gutter="10">
      <el-col :span="6">
        <div class="grid-content ">
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content ">
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content ">
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content ">
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
          <el-link type="info" class="info">信息链接</el-link><br/>
        </div>
      </el-col>
    </el-row>
    <div>@copyright bin 2019-2020 盗版必究</div>
  </div>
</template>

<script>
export default {
  name: 'Footer',
  props: {
    
  },
  methods: {
   
  }


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
   .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    background: #F2F6FC;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 200px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  .footer{
    background:#fff;
  }
  .info{
    margin-left: 0%;
  }
</style>

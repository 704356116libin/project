<template>
 <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="普通登陆" name="first">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login">登陆</el-button>
        </el-form-item>
      </el-form>
    </el-tab-pane>
    <el-tab-pane label="二维码登陆" name="second">暂未开放功能</el-tab-pane>
  </el-tabs>

</template>

<script>
export default {
  name: 'LoginForm',
  props: {
    
  },
  data() {
      return {
       form: {
          name: '',
          region: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
          resource: '',
          desc: ''
        },
        activeName: 'first'
      };
  },
  methods: {
    handleClick(tab, event) {
        console.log(tab, event);
    },
    login:function(){
      console.log('点击了login')
      this.$http.get('/Auth/add_user',{
        }).then(function(response){
        console.log('1111',response);
        }).catch(function(error){
        console.log('2222',error);
        })
    }
  }


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
  
</style>

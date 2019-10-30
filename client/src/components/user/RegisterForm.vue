<template>
 
  <el-form ref="form" :model="form" label-width="80px">
    <el-form-item label="用户名">
      <el-input v-model="form.name"></el-input>
    </el-form-item>
    <el-form-item label="密码">
      <el-input v-model="form.name"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="register">立即注册</el-button>
      <el-button @click="live">残忍离开</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  name: 'RegisterForm',
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
        activeName: 'second'
      };
  },
  methods: {
    handleClick(tab, event) {
        console.log(tab, event);
    },
    //注册事件
    register:function(){
      console.log('点击了register')
    },
    //离开事件
    live:function(){
      console.log('点击了live')
      window.history.go(-1)
    }
  }


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
  
</style>

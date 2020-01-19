<template>
  <div>
    <el-menu
    :default-active="activeIndex2"
    class="el-menu-demo header-menu"
    mode="horizontal"
    @select="handleSelect"
    background-color="#fff"
    text-color="#000"
    active-text-color="#909399">
    <el-menu-item index="1">处理中心11</el-menu-item>
    <el-submenu index="2">
      <template slot="title">我的工作台</template>
      <el-menu-item index="2-1">选项1</el-menu-item>
      <el-menu-item index="2-2">选项2</el-menu-item>
      <el-menu-item index="2-3">选项3</el-menu-item>
      <el-submenu index="2-4">
        <template slot="title">选项4</template>
        <el-menu-item index="2-4-1">选项1</el-menu-item>
        <el-menu-item index="2-4-2">选项2</el-menu-item>
        <el-menu-item index="2-4-3">选项3</el-menu-item>
      </el-submenu>
    </el-submenu>
    <el-menu-item index="3" @click="menu_jump('/login')" data-url="/login">登录</el-menu-item>
    <el-menu-item index="4" @click="menu_jump('/register')" data-url="/register">注册</el-menu-item>
    <el-menu-item index="5" @click="menu_jump('/element')" data-url="/element">element演示</el-menu-item>
    </el-menu>
  </div>
 
</template>

<script>
export default {
  name: 'Header',
  props: {
    msg: String
  },
  data() {
      return {
        activeIndex: '1',
        activeIndex2: '1'
      };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    /**
     *导航点击跳转事件
     */
     menu_jump:function(v){
       console.log('menu_jump',v)
  　   window.location.href = v
     }
  },
  created() {
    this.$http.get('/honor/hello_honor',{
      }).then(function(response){
      console.log('1111',response);
      }).catch(function(error){
      console.log('2222',error);
      })
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .header-menu{
    width: 100%;
  }
  .header-login{
    height: 100%;
    width: 30%;
    margin-left: 70%;
    text-align: center;
  }
</style>

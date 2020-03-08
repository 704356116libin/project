<template>
  <div>
    <el-menu
    
    class="el-menu-demo header-menu"
    mode="horizontal"
    @select="handleSelect"
    background-color="#fff"
    text-color="#000"
    active-text-color="#909399">
    <el-menu-item index="1">关于我们</el-menu-item>
    <el-menu-item index="3" @click="menu_jump('/login')" data-url="/login">登录</el-menu-item>
    <el-menu-item index="4" @click="menu_jump('/register')" data-url="/register">注册</el-menu-item>
    <el-menu-item index="5" @click="menu_jump('/element')" data-url="/element">功能测试</el-menu-item>
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
    this.$http.get('api/Auth/login',{
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

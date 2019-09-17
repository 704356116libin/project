<template>
  <div id="app">
    <div id="nav">
     <Header msg="Welcome to Your Vue.js App"/>
    </div>
    
    <router-view/>
  </div>
  
</template>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background: #f6f6f6;
}
#nav {
  
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
<script>
// @ is an alias to /src
import Header from '@/components/Header.vue'

export default {
  name: 'app',
  components: {
    Header,
  
  }
}
</script>
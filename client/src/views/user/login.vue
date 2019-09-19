<template>
  <div class="login">
    <LoginForm/>
    
  </div>
</template>

<script>
/*引入登陆框组键组件*/
import LoginForm from '@/components/user/LoginForm.vue'
export default {
  name: 'login',
  components: {
   LoginForm
  }
}
</script>

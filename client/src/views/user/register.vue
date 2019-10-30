<template>
  <div class="register">
    <RegisterForm/>
  </div>
</template>

<script>
/*引入登陆框组键组件*/
import RegisterForm from '@/components/user/RegisterForm.vue'
export default {
  name: 'register',
  components: {
   RegisterForm
  }
}
</script>

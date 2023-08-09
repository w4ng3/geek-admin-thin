<template>
  <div class="login-container flx-center">
    <SwitchDark class="dark" />
    <div class="login-box">
      <div class="login-left">
        <!-- <img src="" alt="login" /> -->
      </div>
      <div class="login-form">
        <div class="login-logo">
          <!-- <img class="login-icon" src="@/assets/images/logo.svg" alt="" /> -->
          <h2 class="logo-text">社交圈-后台管理系统</h2>
        </div>
        <LoginForm />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="login">
import SwitchDark from '@/components/SwitchDark/index.vue'
import { LoginForm } from './components'
</script>

<style scoped lang="less">
@import './index.less';
</style>

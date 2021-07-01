import { createApp } from 'vue'
import Login from '@/pages/Login/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(Login)
  app.mount('#login')
})

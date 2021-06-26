import { createApp } from 'vue'
import UserProducts from '@/pages/UserProducts/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserProducts)
  app.mount('#user_products')
})

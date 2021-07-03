import { createApp } from 'vue'
import UserNew from '@/pages/UserNew/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserNew)
  app.mount('#user_new')
})

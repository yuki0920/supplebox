import { createApp } from 'vue'
import UserEdit from '@/pages/UserEdit/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserEdit)
  app.mount('#user_edit')
})

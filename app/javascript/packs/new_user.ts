import { createApp } from 'vue'
import NewUser from '@/pages/NewUser/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(NewUser)
  app.mount('#new_user')
})

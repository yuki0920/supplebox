import { createApp } from 'vue'
import UserProfile from '@/pages/UserProfile/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserProfile)
  app.mount('#user_profile')
})

import { createApp } from 'vue'
import UserPosts from '@/pages/UserPosts/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserPosts)
  app.mount('#user-posts')
})

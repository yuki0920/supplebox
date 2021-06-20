import { createApp } from 'vue'
import UserPosts from '@/pages/UserPosts/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(UserPosts)
  app.use(store, key)
  app.mount('#user-posts')
})

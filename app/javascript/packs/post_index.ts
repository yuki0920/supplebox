import { createApp } from 'vue'
import PostIndex from '@/pages/PostIndex/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(PostIndex)
  app.mount('#post_index')
})

import { createApp } from 'vue'
import PostIndex from '@/pages/PostIndex/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(PostIndex)
  app.use(store, key)
  app.mount('#post_index')
})

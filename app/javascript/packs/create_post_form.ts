import { createApp } from 'vue'
import CreatePostForm from '@/pages/CreatePostForm/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(CreatePostForm)
  app.mount('#post_form')
})

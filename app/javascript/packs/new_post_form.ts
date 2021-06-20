import { createApp } from 'vue'
import NewPostForm from '@/pages/NewPostForm/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(NewPostForm)
  app.mount('#post_form')
})

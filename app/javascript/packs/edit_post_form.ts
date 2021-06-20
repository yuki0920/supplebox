import { createApp } from 'vue'
import EditPostForm from '@/pages/EditPostForm/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(EditPostForm)
  app.mount('#post_form')
})

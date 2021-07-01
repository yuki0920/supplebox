import { createApp } from 'vue'
import Cover from '@/components/Cover/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(Cover)
  app.mount('#cover')
})

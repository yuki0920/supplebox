import { createApp } from 'vue'
import Nav from '@/components/Nav/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(Nav)
  app.mount('#navigation')
})

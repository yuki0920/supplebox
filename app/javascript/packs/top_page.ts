import { createApp } from 'vue'
import TopPage from '@/pages/TopPage/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(TopPage)
  app.mount('#top-page')
})

import { createApp } from 'vue'
import Footer from '@/components/Footer/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(Footer)
  app.mount('#footer')
})

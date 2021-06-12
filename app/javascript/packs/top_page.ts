import { createApp } from 'vue'
import TopPage from '@/components/TopPage/index.vue'
import { store, key } from '../store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(TopPage)
  app.use(store, key)
  app.mount('#top-page')
})

import { createApp } from 'vue'
import Nav from '@/components/Nav/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(Nav)
  app.use(store, key)
  app.mount('#navigation')
})

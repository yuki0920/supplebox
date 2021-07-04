import { createApp } from 'vue'
import NewProduct from '@/pages/NewProduct/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(NewProduct)
  app.mount('#new_product')
})

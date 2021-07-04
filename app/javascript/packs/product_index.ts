import { createApp } from 'vue'
import ProductIndex from '@/pages/ProductIndex/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ProductIndex)
  app.mount('#product_index')
})

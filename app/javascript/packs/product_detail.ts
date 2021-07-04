import { createApp } from 'vue'
import ProductDetail from '@/pages/ProductDetail/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ProductDetail)
  app.mount('#product_detail')
})

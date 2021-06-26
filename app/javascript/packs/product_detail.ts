import { createApp } from 'vue'
import ProductDetail from '@/pages/ProductDetail/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ProductDetail)
  app.use(store, key)
  app.mount('#product_detail')
})

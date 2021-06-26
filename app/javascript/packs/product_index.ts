import { createApp } from 'vue'
import ProductIndex from '@/pages/ProductIndex/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ProductIndex)
  app.use(store, key)
  app.mount('#product_index')
})

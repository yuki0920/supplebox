import { createApp } from 'vue'
import NewProduct from '@/pages/NewProduct/index.vue'
import { store, key } from '@/store/index'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(NewProduct)
  app.use(store, key)
  app.mount('#new_product')
})

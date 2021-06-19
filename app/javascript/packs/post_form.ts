import { createApp } from 'vue'
import ContactForm from '@/components/PostForm/index.vue'

// NOTE: export default () => {}にすると表示できない
document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ContactForm)
  app.mount('#post_form')
})

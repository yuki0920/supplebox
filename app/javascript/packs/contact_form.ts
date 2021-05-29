import { createApp } from 'vue'
import ContactForm from '@/components/ContactForm/index.vue'

// NOTE: export default () => {}にすると表示できない
document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(ContactForm)
  app.mount('#contact_form')
})

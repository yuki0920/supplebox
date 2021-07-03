import { createApp } from 'vue'
import TermsOfUse from '@/pages/TermsOfUse/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(TermsOfUse)
  app.mount('#terms_of_use')
})

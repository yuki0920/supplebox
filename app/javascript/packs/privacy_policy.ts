import { createApp } from 'vue'
import PrivacyPolicy from '@/pages/PrivacyPolicy/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(PrivacyPolicy)
  app.mount('#privacy_policy')
})

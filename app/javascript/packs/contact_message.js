import Vue from 'vue/dist/vue.esm'
import ContactMessage from '../ContactMessage.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#contact_message',
    components: { ContactMessage },
    render: h => h(ContactMessage)
  })
})

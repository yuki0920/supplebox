import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import ContactMessage from '../ContactMessage.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#contact_message',
    components: { ContactMessage },
    render: h => h(ContactMessage)
  })
})

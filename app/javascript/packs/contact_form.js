import Vue from 'vue'
import TurbolinksAdapter from 'vue-turbolinks'
import store from '../store/index'
import ContactForm from '../components/ContactForm'

Vue.use(TurbolinksAdapter)

if (document.getElementById('contact_form')) {
  document.addEventListener('turbolinks:load', () => {
    const app = new Vue({
      el: '#contact_form',
      components: { ContactForm },
      store,
      render: h => h(ContactForm)
    })
  })
}

import Vue from 'vue'
import store from '../store/index'
import ContactForm from '../components/ContactForm'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#contact_form',
    components: { ContactForm },
    store,
    render: h => h(ContactForm)
  })
})

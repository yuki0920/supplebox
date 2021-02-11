import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import ContactForm from '../components/ContactForm'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#contact_form',
    components: { ContactForm },
    render: h => h(ContactForm)
  })
})

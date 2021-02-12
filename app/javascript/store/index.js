import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    outputMessage: false,
    messageText: null,
    messageType: null
  },
  mutations: {
    setMessage(state, payload) {
      state.outputMessage = true
      state.messageText = payload.text
      state.messageType = payload.type

      setTimeout(() => {
        state.outputMessage = false
      }, 5000)
    }
  }
})

export default store

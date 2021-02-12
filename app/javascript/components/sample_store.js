// NOTE: Storybook用のStore
import Vue from 'vue'
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
    }
  }
})

export default store

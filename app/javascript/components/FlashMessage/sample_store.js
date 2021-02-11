import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    message: null
  },
  mutations: {
    setMessage(state, message) {
      state.message = message

      setTimeout(() => {
        state.message = null
      }, 5000);
    }
  }
})

export default store

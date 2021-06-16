import { InjectionKey } from 'vue'
import { createStore, useStore as baseUseStore, Store } from 'vuex'
import axios from '@axios'

type CurrentUser = {
  id: number,
  name: string;
  path: string;
}

type State = {
  currentUser: CurrentUser
}

export const key: InjectionKey<Store<State>> = Symbol()

export const store = createStore<State>({
  state: {
    currentUser: null
  },
  mutations: {
    setCurrentUser(state, user: CurrentUser | null) {
      state.currentUser = user
    }
  },
  actions: {
    async fetchCurrentUser(context) {
      const { data } = await axios.get('/api/sessions/')
      context.commit('setCurrentUser', data.user)
    }
  }
})

export function useStore() {
  return baseUseStore(key)
}

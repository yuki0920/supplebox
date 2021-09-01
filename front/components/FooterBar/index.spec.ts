import { shallowMount } from '@vue/test-utils'
import Footer from './index.vue'

describe('Footer', () => {
  test('is a Vue instance', () => {
    const wrapper = shallowMount(Footer, {
      stubs: ['nuxt-link']
    })

    expect(wrapper.vm).toBeTruthy()
  })
})

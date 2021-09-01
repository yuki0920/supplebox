import { createLocalVue, shallowMount } from '@vue/test-utils'
import VueCompositionApi from '@vue/composition-api'
import Nav from './index.vue'
import { useCurrentUser } from '@/compositions'
const compositions = { useCurrentUser }

const localVue = createLocalVue()
localVue.use(VueCompositionApi)

const stubComponentList = [
  'nuxt-link',
  'b-navbar',
  'b-navbar-toggle',
  'b-collapse',
  'b-navbar-nav',
  'b-nav-item',
  'b-nav-item-dropdown',
  'b-dropdown-item'
]
describe('ログインしていない場合', () => {
  let wrapper: any

  beforeEach(() => {
    jest.spyOn(compositions, 'useCurrentUser').mockReturnValue({
      currentUser: { id: 1, name: 'テスト' } as any,
      isLoggedIn: false as any,
      getCurrentUser: jest.fn().mockReturnValue({ data: { user: { id: 1, name: 'テスト' } } })
    })

    wrapper = shallowMount(Nav, {
      propsData: {
        isLoggedIn: true
      },
      stubs: stubComponentList,
      mocks: {
        $nuxt: {
          context: {
            $axios: {
              get: jest.fn()
            }
          }
        }
      }
    })
  })

  test('項目が正しく表示されること', () => {
    expect(wrapper.text()).toMatch(/プロテイン/)
    expect(wrapper.text()).toMatch(/口コミ/)
    expect(wrapper.text()).toMatch(/プロテイン登録/)
    expect(wrapper.text()).not.toMatch(/マイページ/)
    expect(wrapper.text()).not.toMatch(/ログアウト/)
    expect(wrapper.text()).toMatch(/テストアカウントでログイン/)
    expect(wrapper.text()).toMatch(/新規登録/)
    expect(wrapper.text()).toMatch(/ログイン/)
  })
})

describe('ログインしている場合', () => {
  let wrapper: any

  beforeEach(() => {
    jest.spyOn(compositions, 'useCurrentUser').mockReturnValue({
      currentUser: { id: 1, name: 'テスト' } as any,
      isLoggedIn: true as any,
      getCurrentUser: jest.fn().mockReturnValue({ data: { user: { id: 1, name: 'テスト' } } })
    })

    wrapper = shallowMount(Nav, {
      propsData: {
        isLoggedIn: true
      },
      stubs: stubComponentList,
      mocks: {
        $nuxt: {
          context: {
            $axios: {
              get: jest.fn()
            }
          }
        }
      }
    })
  })

  test('項目が正しく表示されること', () => {
    wrapper.vm.$nextTick(() => {
      expect(wrapper.text()).toMatch(/プロテイン/)
      expect(wrapper.text()).toMatch(/口コミ/)
      expect(wrapper.text()).toMatch(/プロテイン登録/)
      expect(wrapper.text()).toMatch(/マイページ/)
      expect(wrapper.text()).toMatch(/ログアウト/)
      expect(wrapper.text()).not.toMatch(/テストアカウントでログイン/)
      expect(wrapper.text()).not.toMatch(/新規登録/)
      expect(wrapper.text()).not.toMatch(/ログイン/)
    })
  })
})

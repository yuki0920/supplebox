<template>
  <header>
    <div>
      <b-navbar toggleable="lg" type="light" variant="light">
        <nuxt-link to="/">
          <img
            alt="SuppleBox"
            height="30"
            src="https://supplebox.herokuapp.com/images/logo.png"
          >
        </nuxt-link>
        <b-navbar-toggle target="nav-collapse" />
        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item to="/products">
              プロテイン
            </b-nav-item>
            <b-nav-item to="/posts">
              口コミ
            </b-nav-item>
            <b-nav-item to="/products/new">
              プロテイン登録
            </b-nav-item>
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto">
            <template v-if="isLoggedIn && currentUser !== null">
              <b-nav-item-dropdown :text="currentUser.name" right>
                <b-dropdown-item :to="`/users/${currentUser.id}`">
                  マイページ
                </b-dropdown-item>
                <b-dropdown-item @click="logout">
                  ログアウト
                </b-dropdown-item>
              </b-nav-item-dropdown>
            </template>
            <template v-else>
              <b-nav-item @click="loginAsTestUser">
                テストアカウントでログイン
              </b-nav-item>
              <b-nav-item to="/signup">
                新規登録
              </b-nav-item>
              <b-nav-item to="/login">
                ログイン
              </b-nav-item>
            </template>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
  </header>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'
import { useCurrentUser, useSession } from '@/compositions'

export default defineComponent({
  name: 'NavBar',
  props: {
    isLoggedIn: {
      type: Boolean,
      required: true
    }
  },
  setup () {
    const { currentUser } = useCurrentUser()
    const { loginAsTestUser, logout } = useSession()

    return {
      loginAsTestUser,
      currentUser,
      logout
    }
  }
})
</script>

<style lang="scss" scoped>
</style>

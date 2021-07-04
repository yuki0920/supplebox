<template>
  <header>
    <nav class="o-nav navbar navbar-expand-lg navbar-light bg-light global-nav">
      <a href="/">
        <img
          alt="SuppleBox"
          height="30"
          src="https://supplebox.jp/images/logo.png"
        >
      </a>
      <button
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle
        navigation"
        class="navbar-toggler"
        data-target="#navbarSupportedContent"
        data-toggle="collapse"
        type="button"
      >
        <span class="navbar-toggler-icon" />
      </button>
      <div
        id="navbarSupportedContent"
        class="collapse navbar-collapse"
      >
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a
              class="nav-link"
              href="/products"
            >
              プロテイン
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="/posts"
            >
              口コミ
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="/products/new"
            >
              プロテイン登録
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="/contacts"
            >
              問い合わせ
            </a>
          </li>
        </ul>
        <div
          v-if="isLoggedIn"
          class="o-nav-dropdown nav-item dropdown"
        >
          <a
            id="navbarDropdown"
            aria-expanded="false"
            aria-haspopup="true"
            class="dropdown-toggle"
            data-toggle="dropdown"
            href="#"
            role="button"
          >
            {{ currentUser.name }}
          </a>
          <div
            aria-labelledby="navbarDropdown"
            class="dropdown-item__dropdown-menu dropdown-menu"
          >
            <a
              class="dropdown-item"
              :href="`/users/${currentUser.id}`"
            >マイページ</a>
            <div class="dropdown-divider" />
            <span
              class="o-nav__dropdown-item dropdown-item"
              @click="logout"
            >ログアウト</span>
          </div>
        </div>
        <div v-else>
          <button
            class="o-nav__button btn btn-outline-success"
            type="button"
            @click="loginAsTestUser"
          >
            テストアカウントでログイン
          </button>
          <a
            class="o-nav__button btn btn-outline-success"
            href="/signup"
          >
            新規登録
          </a>
          <a
            class="o-nav__button btn btn-outline-success"
            href="/login"
          >
            ログイン
          </a>
        </div>
      </div>
    </nav>
  </header>
</template>

<script lang="ts">
import { useCurrentUser, useSessions } from '@/compositions'

export default {
  name: 'Nav',
  setup() {
    const { currentUser, isLoggedIn } = useCurrentUser()
    const { loginAsTestUser, logout } = useSessions()

    return {
      loginAsTestUser,
      currentUser,
      isLoggedIn,
      logout
    }
  }
}
</script>

<style lang="scss" scoped>
.o-nav {
  .dropdown-menu {
    left: -60px;
  }
  .dropdown-item {
    cursor: pointer;
  }
  .o-nav-gravatar-img {
    width: 20px;
  }
  &__button {
    margin-right: 4px;
  }
}
</style>

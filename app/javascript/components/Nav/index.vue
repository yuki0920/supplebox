<template>
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
            href="/rankings"
          >
            ランキング
          </a>
        </li>
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
            href="/brands"
          >
            ブランド
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
            href="/users"
          >
            ユーザー
          </a>
        </li>
        <li
          v-if="isLoggedIn"
          class="nav-item"
        >
          <a
            class="nav-link"
            href="/products/new"
          >
            プロテイン登録
          </a>
        </li>
      </ul>
      <div
        v-if="isLoggedIn()"
        class="o-nav-dropdown nav-item dropdown"
      >
        <a
          id="navbarDropdown"
          aria-expanded="false"
          aria-haspopup="true"
          class="nav-link dropdown-toggle"
          data-toggle="dropdown"
          href="#"
          role="button"
        >
          {{ user.name }}
        </a>
        <div
          aria-labelledby="navbarDropdown"
          class="dropdown-menu"
        >
          <a
            class="dropdown-item"
            href="/users/2"
          >マイページ</a>
          <div class="dropdown-divider" />
          <a
            class="dropdown-item"
            rel="nofollow"
            data-method="delete"
            href="/logout"
          >ログアウト</a>
        </div>
      </div>
      <div v-else>
        <a
          class="global-nav__button btn btn-outline-success"
          href="/signup"
        >
          新規登録
        </a>
        <a
          class="global-nav__button btn btn-outline-success"
          href="/login"
        >
          ログイン
        </a>
      </div>
    </div>
  </nav>
</template>

<script lang="ts">

export default {
  name: 'Nav',
  props: {
    user: {
      type: Object,
      required: false,
      default: () => {
        return { name: 'yuki'}
      }
    },
  },

  setup(props) {
    const isLoggedIn = () => {
      return !!props.user
    }

    return {
      isLoggedIn
    }
  }
}
</script>

<style scoped>
.dropdown-menu {
  left: -44px;
}
.o-nav-gravatar-img {
  width: 20px;
}
</style>

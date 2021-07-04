<template>
  <div class="o-user-nav nav nav-pills nav-fill">
    <a
      class="user-nav__item nav-link nav-item"
      :class="{active: !isLikeProductsPage}"
      :href="`/users/${userId}`"
    >口コミ一覧
    </a><a
      class="user-nav__item nav-link nav-item "
      :class="{active: isLikeProductsPage}"
      :href="`/users/${userId}/like_products`"
    >お気に入りのプロテイン一覧
    </a>
  </div>
</template>

<script lang="ts">

export default {
  name: 'UserNav',
  setup() {
    const pathname = location.pathname
    const userId = pathname.split('/').slice(2)[0]
    const isLikeProductsPage = pathname.includes('like_products')

    return {
      userId,
      isLikeProductsPage
    }
  }
}
</script>

<style lang="scss" scoped>
.o-user-nav {
  .nav-link.active {
    color: #4fd2c2;
    background-color: white;
  }
}
</style>

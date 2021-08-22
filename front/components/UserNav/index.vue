<template>
  <div class="o-user-nav nav nav-pills nav-fill">
    <nuxt-link
      class="user-nav__item nav-link nav-item"
      :class="{active: !isLikeProductsPage}"
      :to="`/users/${userId}`"
    >
      口コミ一覧
    </nuxt-link>
    <nuxt-link
      class="user-nav__item nav-link nav-item "
      :class="{active: isLikeProductsPage}"
      :to="`/users/${userId}/like_products`"
    >
      お気に入りのプロテイン一覧
    </nuxt-link>
  </div>
</template>

<script lang="ts">
import { defineComponent, useRoute } from '@nuxtjs/composition-api'
import { useId } from '@/compositions'

export default defineComponent({
  name: 'UserNav',
  setup () {
    const route = useRoute()
    const userId = useId()
    const isLikeProductsPage = route.value.path.includes('like_products')

    return {
      userId,
      isLikeProductsPage
    }
  }
})
</script>

<style lang="scss" scoped>
.o-user-nav {
  .nav-link.active {
    color: #4fd2c2;
    background-color: white;
  }
}
</style>

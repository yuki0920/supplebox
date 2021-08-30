<template>
  <div>
    <NavBar :is-logged-in="isLoggedIn" class="mb-3" />
    <div class="container">
      <Nuxt />
    </div>
    <FooterBar />
  </div>
</template>

<script lang="ts">
// TODO: sessionのロード完了後にレンダリングする
import { defineComponent } from '@nuxtjs/composition-api'
import { useCurrentUser } from '@/compositions'

export default defineComponent({
  setup () {
    const { isLoggedIn } = useCurrentUser()

    return {
      isLoggedIn
    }
  }
})
</script>
<style lang="scss">
</style>

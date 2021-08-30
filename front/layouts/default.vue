<template>
  <div class="default-layout d-flex flex-column">
    <NavBar :is-logged-in="isLoggedIn" class="mb-3" />
    <div class="container">
      <Nuxt />
    </div>
    <FooterBar class="mt-auto" />
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
.default-layout {
  min-height: 100vh;
}
</style>

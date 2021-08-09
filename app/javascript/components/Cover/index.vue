<template>
  <div class="o-cover jumbotron w-100">
    <div class="o-cover__inner container d-flex flex-column h-100">
      <h1 class="display-3 text-white font-weight-bold d-3">
        プロテイン選びで
        <br>
        失敗したくないあなたへ
      </h1>
      <div class="o-cover__link d-flex justify-content-center">
        <a
          v-if="!isLoggedIn"
          class="btn btn-success"
          href="/signup"
        >
          SuppleBoxを始める
        </a>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { useCurrentUser } from '@/compositions'

export default {
  name: 'Cover',
  setup() {
    const { isLoggedIn} = useCurrentUser()

    return { isLoggedIn }
  }
}
</script>

<style lang="scss" scoped>
.o-cover {
  background: url("/images/cover-bg.jpg") center center no-repeat;
  background-size: cover;
  &__inner {
    height: 100%;
    margin: auto;
  }
  h1 {
    font-size: 2.5em;
    text-shadow:
      black 1px 1px 0px, black -1px 1px 0px,
      black 1px -1px 0px, black -1px -1px 0px;
  }
}
</style>

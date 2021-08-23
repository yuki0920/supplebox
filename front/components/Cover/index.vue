<template>
  <div class="o-cover jumbotron w-100">
    <div class="o-cover__inner d-flex flex-column align-items-center h-100">
      <h1 class="display-3 text-white font-weight-bold d-3">
        プロテイン選びで失敗したくないあなたへ
      </h1>
      <div class="o-cover__link d-flex justify-content-center">
        <nuxt-link
          v-if="!isLoggedIn"
          class="btn btn-success"
          to="/signup"
        >
          SuppleBoxを始める
        </nuxt-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  name: 'Cover',
  props: {
    isLoggedIn: {
      type: Boolean,
      required: true
    }
  },
  setup () {
  }
})
</script>

<style lang="scss" scoped>
.o-cover {
  background: url("~assets/images/cover.jpg") center center no-repeat;
  background-size: cover;
  &__inner {
    gap: 2rem;
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

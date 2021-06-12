<template>
  <div class="o-cover">
    <cover>
      <cover-inner>
        <cover-contents>
          <h1>
            プロテイン選びで失敗したくないあなたへ
          </h1>
          <a
            v-if="!isLoggedIn"
            class="o-cover__link btn btn-success"
            href="/signup"
          >
            SuppleBoxを始める
          </a>
        </cover-contents>
      </cover-inner>
    </cover>
  </div>
</template>

<script lang="ts">
import { computed } from 'vue'
import { useStore } from '../../store/index'

export default {
  setup() {
    console.log('Hello')
    const store = useStore()
    const currentUser = computed(() => store.state.currentUser)
    const getCurrentUser = async () => {
      store.dispatch('fetchCurrentUser')
    }
    const isLoggedIn = () => {
      return !!currentUser.value
    }

    getCurrentUser()
    return {
      isLoggedIn
    }
  }
}
</script>

<style lang="scss" scoped>
.o-cover {
  margin-top: -20px;
  margin-bottom: 20px;
  width: 100%;
  height: auto;
  background: url("/images/cover-bg.jpg") center center no-repeat;
  background-size: cover;
  .cover-inner {
    height: 100%;
    margin: auto;
    display: table;
    .cover-contents {
      display: table-cell;
      vertical-align: middle;
      text-align: center;
      position: relative;
      h1 {
        margin: 0 0 20px 0;
        padding: 3em 0;
        color: white;
        font-weight: bold;
        letter-spacing: 0.15em;
        font-size: 6vw;
        text-shadow:
          black 1px 1px 0px, black -1px 1px 0px,
          black 1px -1px 0px, black -1px -1px 0px;
      }
    }
  }
  &__link {
    margin-bottom: 20px;
  }
}
</style>

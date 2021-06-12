<template>
  <div class="p-toppage">
    <h1 class="p-toppage__title">
      SuppleBoxとは
    </h1>
    <p class="p-toppage__title-annotation">
      プロテイン選びで失敗したく無い方に向けた、プロテイン特化型の口コミ共有サービスです。
    </p>
    <ServiceDescription />

  </div>
</template>

<script lang="ts">
import ServiceDescription from "../ServiceDescription/index.vue"
export default {
  components: {
    ServiceDescription
  },
  setup() {
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
.p-toppage {
  &__title {

  }
  &__title-annotation {
    font-size: 1.5rem;
    text-align: center;
  }
}
</style>

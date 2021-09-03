<template>
  <div class="o-service-description row mb-0">
    <div class="col-md-4 col-sm-6 text-center">
      <h3 class="o-service-description__heading font-weight-bold mb-3">
        <BIconHandThumbsUp />
        リアルな口コミ
      </h3>
      <p>✔ 実際の購入者によるリアルな口コミで<br>失敗しないプロテイン選びをサポートします</p>
    </div>
    <div class="col-md-4 col-sm-6 text-center">
      <h3 class="o-service-description__heading font-weight-bold mb-3">
        <BIconSearch />
        探しやすい
      </h3>
      <p>✔ 気になるプロテインをランキングや<br>最新の口コミから検索可能です</p>
    </div>
    <div class="col-md-4 col-sm-6 text-center">
      <h3 class="o-service-description__heading font-weight-bold mb-3">
        <BIconCardImage />
        見やすいレイアウト
      </h3>
      <p>✔ PCやスマートフォン<br>どちらからでも見やすいデザインです</p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  name: 'ServiceDescription'
})
</script>

<style lang="scss" scoped>
.o-service-description {
  &__icon {
    font-size: 40px;
  }
  &__heading {
    font-size: 20px;
  }
}
</style>

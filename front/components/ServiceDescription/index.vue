<template>
  <div class="o-service-description row mb-0">
    <div class="col-md-4 col-sm-6 text-center">
      <!-- TODO: iconを表示する -->
      <!-- <BIconHandThumbsUp /> -->
      <h3 class="o-service-description__heading font-weight-bold mb-1">
        リアルな口コミ
      </h3>
      <p>✔  実際の購入者によるリアルな口コミで失敗しないプロテイン選びをサポート</p>
    </div>
    <div class="col-md-4 col-sm-6 text-center">
      <!-- <BIconSearch /> -->
      <h3 class="o-service-description__heading font-weight-bold mb-1">
        探しやすい
      </h3>
      <p>✔  気になるアイテムをアイテム一覧や最新の口コミから検索可能</p>
    </div>
    <div class="col-md-4 col-sm-6 text-center">
      <!-- <BIconCardImage /> -->
      <h3 class="o-service-description__heading font-weight-bold mb-1">
        見やすいレイアウト
      </h3>
      <p>✔  PCやスマートフォンどちらからでも見やすい設計</p>
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

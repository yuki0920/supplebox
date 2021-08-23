<template>
  <div class="p-new-product">
    <h2>アイテムを登録する</h2>
    <form
      class="p-new-product__form form-inline justify-content-center mb-1"
      @submit.prevent="searchNewProducts"
    >
      <div class="form-group">
        <input
          v-model="keyword"
          class="form-control"
          placeholder="例）ザバス プロテイン"
          size="40"
        >
      </div>
      <input
        type="submit"
        value="アイテムを検索"
        class="btn btn-success"
      >
    </form>
    <ProductItems
      v-if="products.length > 1"
      :is-new-page="true"
      :is-logged-in="isLoggedIn"
      :products="products"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'
import { useCurrentUser, useNewProducts } from '@/compositions'

export default defineComponent({
  name: 'NewProduct',
  setup () {
    const { isLoggedIn } = useCurrentUser()
    const { products, keyword, searchNewProducts } = useNewProducts()

    return {
      isLoggedIn,
      searchNewProducts,
      keyword,
      products
    }
  }
})
</script>

<style lang="scss" scoped>
.p-new-product {
}
</style>

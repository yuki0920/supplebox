<template>
  <div class="p-product-index">
    <h1 class="text-center">
      プロテインを検索する
    </h1>
    <form
      class="p-product-index__form form-inline justify-content-center mb-1"
      @submit.prevent="load(1)"
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
    <Paginator
      :total-pages="totalPages"
      @page-changed="load($event)"
    />
    <ProductItems
      v-if="products.length > 1"
      :is-logged-in="isLoggedIn"
      :products="products"
    />
    <Paginator
      :total-pages="totalPages"
      @page-changed="load($event)"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, ref } from '@nuxtjs/composition-api'
import { useCurrentUser, useProducts } from '@/compositions'

export default defineComponent({
  name: 'Products',
  setup () {
    const { isLoggedIn } = useCurrentUser()
    const keyword = ref('')
    const { products, totalPages, getProducts } = useProducts()

    const load = async (page = 1) => {
      await getProducts({ per: 12, page, keyword: keyword.value })
    }

    onMounted(async () => {
      await load()
    })

    return {
      isLoggedIn,
      totalPages,
      load,
      keyword,
      products
    }
  }
})
</script>

<style lang="scss" scoped>
.p-product-index {
}
</style>

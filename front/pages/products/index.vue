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
    <ProductItems
      v-if="products.length > 1"
      :is-logged-in="isLoggedIn"
      :products="products"
    />
    <div class="overflow-auto">
      <b-pagination-nav :link-gen="linkGen" :number-of-pages="totalPages" use-router />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, ref, useRouter } from '@nuxtjs/composition-api'
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

    const linkGen = (pageNum: number) => {
      const queryParams = pageNum === 1 ? '?' : `?page=${pageNum}`
      return keyword.value ? `${queryParams}?keyword=${keyword.value}` : queryParams
    }

    const router = useRouter()
    router.beforeEach((to, from, next) => {
      if (to.name === from.name && (typeof to.query.page === 'string' || to.query.page === undefined)) {
        load(parseInt(to.query.page, 10) || 1)
        scrollTo(0, 0)
      }
      next()
    })

    return {
      isLoggedIn,
      totalPages,
      load,
      keyword,
      products,
      linkGen
    }
  }
})
</script>

<style lang="scss" scoped>
.p-product-index {
}
</style>

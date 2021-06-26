<template>
  <div class="p-product-index">
    <h2>プロテインをを検索する</h2>
    <form
      class="p-product-index__form form-inline"
      @submit.prevent="load"
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
import { ref, computed } from "vue"
import { useStore } from '@/store'
import ProductItems from "@/components/ProductItems/index.vue"
import Paginator from "@/components/Paginator/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"

export default {
  name: 'NewProduct',
  components: {
    ProductItems,
    Paginator,
  },
  setup() {
    // TODO: 共通化したい
    const store = useStore()
    const getCurrentUser = async () => {
      store.dispatch('fetchCurrentUser')
    }
    getCurrentUser()
    const isLoggedIn = computed(() => store.getters.isLoggedIn)

    const keyword = ref('')
    const products = ref([])
    const totalPages = ref(1)

    const load = async (page = 1) => {
      const { data } = await new DefaultApi().fetchProducts(12, page, keyword.value)

      products.value = data.products
      totalPages.value = data.total_pages
    }
    load()

    return {
      isLoggedIn,
      totalPages,
      load,
      keyword,
      products,
    }
  },
}
</script>

<style lang="scss" scoped>
.p-product-index {
  &__form {
    justify-content: center;
    margin-bottom: 1em;
  }
}
</style>

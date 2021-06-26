<template>
  <div class="p-new-product">
    <h2>アイテムを登録する</h2>
    <form
      class="p-new-product__form form-inline"
      @submit.prevent="fetchProducts"
    >
      <div class="form-group">
        <input
          v-model="keyword"
          name="keyword"
          class="form-control"
          placeholder="例）ザバス プロテイン"
          size="40"
        >
      </div>
      <input
        type="submit"
        name="commit"
        value="アイテムを検索"
        class="btn btn-success"
      >
    </form>
    <ProductItems
      v-if="products.length > 1"
      :is-new-page="isNewPage"
      :is-logged-in="isLoggedIn"
      :products="products"
    />
  </div>
</template>

<script lang="ts">
import { ref, computed } from "vue"
import { useStore } from '@/store'
import ProductItems from "@/components/ProductItems/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"

export default {
  name: 'NewProduct',
  components: {
    ProductItems,
  },
  setup() {
    const isNewPage = location.pathname.split("/").slice(-1)[0] === 'new'
    const store = useStore()
    const getCurrentUser = async () => {
      store.dispatch('fetchCurrentUser')
    }
    getCurrentUser()
    const isLoggedIn = computed(() => store.getters.isLoggedIn)

    const keyword = ref('')
    const products = ref([])
    const fetchProducts = async () => {
      const { data } = await new DefaultApi().searchProductsFromAmazon(keyword.value)

      products.value = data.products
    }

    return {
      isNewPage,
      isLoggedIn,
      fetchProducts,
      keyword,
      products,
    }
  },
}
</script>

<style lang="scss" scoped>
.p-new-product {
  &__form {
    justify-content: center;
    margin-bottom: 1em;
  }
}
</style>

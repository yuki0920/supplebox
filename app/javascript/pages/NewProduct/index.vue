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
      :is-logged-in="true"
      :products="products"
    />
  </div>
</template>

<script lang="ts">
import { ref } from "vue"
import ProductItems from "@/components/ProductItems/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"

export default {
  name: 'NewProduct',
  components: {
    ProductItems,
  },
  setup() {
    const keyword = ref('')
    const products = ref([])
    const fetchProducts = async () => {
      const { data } = await new DefaultApi().searchProductsFromAmazon(keyword.value)

      products.value = data.products
    }

    return {
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

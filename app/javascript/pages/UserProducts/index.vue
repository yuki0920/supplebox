<template>
  <div class="p-product-index">
    <ProductItems
      v-if="products.length > 1"
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
  name: 'UserProducts',
  components: {
    ProductItems,
  },
  setup() {
    const products = ref([])

    const load = async () => {
      const userId = parseInt(location.pathname.split("/").slice(-2)[0])
      const { data } = await new DefaultApi().fetchProducts(120, 1, '', userId)

      products.value = data.products
    }
    load()

    return {
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

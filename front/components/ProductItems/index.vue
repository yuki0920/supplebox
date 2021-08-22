<template>
  <div class="o-product-items o-toppage__products-deck card-deck">
    <ProductItem
      v-for="product in products"
      :key="product.id"
      :is-new-page="isNewPage"
      :is-logged-in="isLoggedIn"
      :product="product"
      class="o-product-items__item"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, PropType } from '@nuxtjs/composition-api'
import { GetProductsResponseResourceEach } from '@/types/typescript-axios'

export default defineComponent({
  name: 'ProductItems',
  props: {
    isNewPage: {
      type: Boolean,
      required: false,
      default: false
    },
    isLoggedIn: {
      type: Boolean,
      required: false,
      default: false
    },
    products: {
      type: Array as PropType<GetProductsResponseResourceEach[]>,
      required: true
    }
  },
  setup () {
  }
})
</script>

<style lang="scss" scoped>
.o-product-items {
  &__item {
    padding: 0;
    margin-bottom: 12px;
  }
}
</style>

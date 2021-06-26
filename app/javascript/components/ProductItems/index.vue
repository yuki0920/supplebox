<template>
  <div class="o-product-items o-toppage__products-deck card-deck">
    <ProductItem
      v-for="product in products"
      :key="product.id"
      :is-logged-in="isLoggedIn"
      :product="product"
      class="o-product-items__item"
    />
  </div>
</template>

<script lang="ts">
import ProductItem from "@/components/ProductItem/index.vue";

export default {
  name: 'ProductItems',
  components: {
    ProductItem,
  },
  props: {
    isLoggedIn: {
      type: Boolean,
      required: false,
      default: false
    },
    products: {
      type: Array,
      required: true
    }
  },
  setup() {
  }
}
</script>

<style lang="scss" scoped>
.o-product-items {
  &__item {
    padding: 0;
    margin-bottom: 12px;
  }
}
</style>

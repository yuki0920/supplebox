<template>
  <div class="o-product-item card">
    <div class="product-header">
      <img :alt="product.title" class="card-img-top" :src="product.picture">
      <rect fill="#868e96" height="100%" width="100%"></rect>
    </div>
    <div class="card-body">
      <p class="card-title">{{ product.brand_name }}</p>
      <p class="card-text"><a href="/products/2">{{ product.title }}</a></p>
      <div class="star">
        <small>(口コミ {{ product.post_count }} 件)</small>
      </div>
    </div>
    <div class="card-footer">
      <small class="text-muted text-center">
      14 Likes
      </small>
    </div>
  </div>
</template>
<script>

export default {
  name: 'ProductItem',
  props: {
    product: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
p {
  margin: 0
}
</style>

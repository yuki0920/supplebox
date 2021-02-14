<template>
  <div class="o-product-item card">
    <div class="product-header">
      <img
        :alt="product.title"
        class="card-img-top"
        :src="product.image_url"
      >
      <rect
        fill="#868e96"
        height="100%"
        width="100%"
      />
    </div>
    <div class="card-body">
      <p class="card-title">
        {{ product.brand_amazon_name }}
      </p>
      <p class="card-text">
        <a href="/products/2">{{ product.title }}</a>
      </p>
      <div class="star">
        <StarRating
          :increment="0.1"
          :rating="product.rate"
          :star-size="14"
          :show-rating="false"
          read-only
        />
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
import StarRating from 'vue-star-rating'

export default {
  name: 'ProductItem',
  components: {
    StarRating
  },
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

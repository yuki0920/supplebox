<template>
  <div class="o-product-item col-md-3 col-sm-4 col-xs-12">
    <div class="o-product-item__card card">
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
          <a :href="product.product_link">{{ product.title }}</a>
        </p>
        <div class="star">
          <!-- <StarRating
            :increment="0.1"
            :rating="0"
            :star-size="14"
            :show-rating="false"
            read-only
          /> -->
          <small>評価: {{ product.rate }} (口コミ {{ product.post_count }} 件)</small>
        </div>
      </div>
      <div class="card-footer">
        <small class="text-muted text-center">
          {{ product.likes }} Likes
        </small>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// import StarRating from 'vue-star-rating'

export default {
  name: 'ProductItem',
  components: {
    // StarRating
  },
  props: {
    product: {
      type: Object,
      required: true
    }
  },
}
</script>

<style lang="scss" scoped>
.o-product-item {
  &__card {
    margin: 0 6px;
  }
}
</style>

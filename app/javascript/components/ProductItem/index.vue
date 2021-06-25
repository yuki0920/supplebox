<template>
  <div class="o-product-item col-md-3 col-sm-4 col-xs-12">
    <div class="o-product-item__card card">
      <div class="o-product-item__header">
        <img
          :alt="product.title"
          class="o-product-item__image card-img-top"
          :src="product.image_url"
        >
      </div>
      <div class="o-product-item__body  card-body">
        <p class="card-title">
          {{ product.brand_amazon_name }}
        </p>
        <p class="card-text">
          <a :href="product.product_link">{{ product.title }}</a>
        </p>
        <div class="star">
          <small>評価: {{ product.rate }} (口コミ {{ product.post_count }} 件)</small>
        </div>
      </div>
      <div
        v-if="isLogin"
        class="o-product-item__like-button-container"
      >
        <a
          v-if="product.is_likes"
          class="o-product-item__like-button btn btn-success"
          href="javascript:void(0)"
          @click="like(product.id)"
        >お気に入り登録中</a>
        <a
          v-else
          class="o-product-item__like-button btn btn-outline-success"
          href="javascript:void(0)"
          @click="like(product.id)"
        >お気に入り登録する</a>
      </div>
    </div>
    <div class="card-footer">
      <small class="text-muted text-center">
        {{ product.likes }} Likes
      </small>
    </div>
  </div>
</template>

<script lang="ts">

export default {
  name: 'ProductItem',
  components: {
  },
  props: {
    product: {
      type: Object,
      required: true
    },
    isLogin: {
      type: Boolean,
      required: false,
      default: false
    }
  },
}
</script>

<style lang="scss" scoped>
.o-product-item {
  &__card {
    margin: 0 6px;
    padding: 12px;
  }
  &__image {
    height: 160px;
    width: 100%;
    object-fit: contain;
  }
  &__body {
    padding: 6px;
  }
  &__like-button {
    font-size: 0.8em;
    display: block;
  }
}
</style>

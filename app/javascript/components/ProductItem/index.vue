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
        {{ product.brand_amazon_name }}
        <br>
        <a :href="product.product_link">{{ product.title }}</a>
        <div
          v-if="!isNewPage"
          class="o-product-item__rate"
        >
          <small>
            評価: {{ product.rate }} (口コミ {{ product.post_count }} 件)
            <br>
            お気に入り登録: {{ product.likes }} 人
          </small>
        </div>
      </div>
      <div
        v-if="isLoggedIn"
        class="o-product-item__button-container"
      >
        <template v-if="!isNewPage">
          <a
            v-if="isLiked"
            class="o-product-item__button btn btn-success"
            href="javascript:void(0)"
            @click="unlike(product.id)"
          >お気に入り登録中</a>
          <a
            v-else
            class="o-product-item__button btn btn-outline-success"
            href="javascript:void(0)"
            @click="like(product.id)"
          >お気に入り登録する</a>
        </template>
        <template v-else>
          <a
            v-if="isCreated"
            class="o-product-item__button btn btn-success"
            href="javascript:void(0)"
            @click="create"
          >プロテインを登録する</a>
          <span v-else>登録済み</span>
        </template>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import { DefaultApi } from '@/types/typescript-axios/api'
export default {
  name: 'ProductItem',
  components: {
  },
  props: {
    product: {
      type: Object,
      required: true
    },
    isLoggedIn: {
      type: Boolean,
      required: false,
      default: false
    },
    isNewPage: {
      type: Boolean,
      required: false,
      default: false
    }
  },
  setup(props) {
    const isLiked = ref(props.product.is_likes)

    const like = async(id: number) => {
      await new DefaultApi().likeProduct(id)
      isLiked.value = !isLiked.value
    }
    const unlike = async(id: number) => {
      await new DefaultApi().unlikeProduct(id)
      isLiked.value = !isLiked.value
    }

    const isCreated = ref(props.product.id === null)
    const create = async() => {
      const params = { product: {
          title: props.product.title,
          url: props.product.url,
          image_url: props.product.image_url,
          asin: props.product.asin,
          price: props.product.price,
          brand_amazon_name: props.product.brand_amazon_name
        }
      }
      await new DefaultApi().createProduct(params)
      isCreated.value = !isCreated.value
    }
    return {
      isLiked,
      isCreated,
      like,
      unlike,
      create
    }
  }
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
  &__button {
    font-size: 0.8em;
    display: block;
  }
}
</style>

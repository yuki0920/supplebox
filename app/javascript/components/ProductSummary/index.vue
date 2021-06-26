<template>
  <div class="o-product-summary">
    <h2>{{ product.title }}</h2>
    <div class="row">
      <div class="col-md-4">
        <div class="product_detail card mb-3">
          <img
            alt=""
            :src="product.image_url"
          >
        </div>
      </div>
      <div class="col-md-8">
        <table class="table">
          <tbody>
            <tr>
              <th>価格</th>
              <td>
                ¥ {{ product.price }}
              </td>
            </tr>
            <tr>
              <th>ブランド</th>
              <td>
                {{ product.brand_amazon_name }}
              </td>
            </tr>
          </tbody>
        </table>
        <div class="o-product-summary__buttons">
          <a
            target="_blank"
            rel="noopener"
            class="o-product-summary__button btn btn-outline-secondary"
            :href="product.url"
          >Amazonで詳しく見る</a>
          <a
            target="_blank"
            rel="noopener"
            class="o-product-summary__button btn btn-outline-danger"
            :href="`https://hb.afl.rakuten.co.jp/hgc/169cb48b.e76a4cfb.169cb48c.b496683c/?pc=http://search.rakuten.co.jp/search/mall?sitem=${product.brand_amazon_name}+プロテイン`"
          >楽天で詳しく見る</a>
          <LikeButton
            v-if="isLoggedIn"
            class="o-product-summary__button"
            :product-id="product.id"
            :is-liked="product.is_likes"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import LikeButton from '@/components/LikeButton/index.vue'

export default {
  name: 'ProductSummary',
  components: {
    LikeButton
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
  },
  setup(props) {
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
.o-product-summary {
  &__button {
    display: block;
    margin-bottom: .5em;
  }
}
</style>

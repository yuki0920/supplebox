<template>
  <div class="p-toppage">
    <section class="p-toppage__title-container">
      <h1 class="p-toppage__title">
        SuppleBoxとは
      </h1>
      <p class="p-toppage__title-annotation">
        プロテイン選びで失敗したく無い方に向けた、プロテイン特化型の口コミ共有サービスです。
      </p>
      <ServiceDescription />
    </section>
    <section class="p-toppage__products-container">
      <h2>
        お気に入りアイテムランキング
      </h2>
      <div class="card-deck">
        <ProductItem
          v-for="product in products"
          :key="product.id"
          :product="product"
        />
      </div>
      <div class="text-center">
        <a
          href="/rankings"
          class="btn btn-success btn-lg"
        >
          お気に入りアイテムをもっと見る
        </a>
      </div>
    </section>
    <section class="p-toppage__posts-container">
      <h2>
        最新の口コミ
      </h2>
      <PostItem
        v-for="post in posts"
        :key="post.id"
        :post="post"
      />
      <div class="text-center">
        <a
          href="/posts"
          class="btn btn-success btn-lg"
        >
          最新の口コミをもっと見る
        </a>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import axios from '@axios'
import ServiceDescription from "../ServiceDescription/index.vue"
import ProductItem from '../ProductItem/index.vue'
import PostItem from '../PostItem/index.vue'

export default {
  components: {
    ServiceDescription,
    ProductItem,
    PostItem
  },
  setup() {
    const products = ref([])
    const fetchProducts = async () => {
      const { data } = await axios.get('/api/products?limit=4')

      products.value = data.products
    }
    fetchProducts()

    const posts = ref([])
    const fetchPosts = async() => {
      const { data } = await axios.get('/api/posts?limit=3')

      posts.value = data.posts
    }
    fetchPosts()

    return {
      products,
      posts
    }
  }
}
</script>

<style lang="scss" scoped>
.p-toppage {
  &__title {

  }
  &__title-annotation {
    font-size: 1.5rem;
    text-align: center;
  }
}
</style>

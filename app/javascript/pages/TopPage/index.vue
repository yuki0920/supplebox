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
      <h2>お気に入りアイテムランキング</h2>
      <ProductItems
        :is-logged-in="isLoggedIn"
        :products="products"
        class="p-toppage__products"
      />
      <div class="text-center">
        <a
          href="/products"
          class="btn btn-success btn-lg"
        >
          お気に入りアイテムをもっと見る
        </a>
      </div>
    </section>
    <section class="p-toppage__posts-container">
      <h2>最新の口コミ</h2>
      <div class="p-toppage__posts">
        <PostItem
          v-for="post in posts"
          :key="post.id"
          :post="post"
        />
      </div>
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
import { ref } from "vue"
import ServiceDescription from "@/components/ServiceDescription/index.vue"
import ProductItems from "@/components/ProductItems/index.vue"
import PostItem from "@/components/PostItem/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"
import { useCurrentUser } from '@/compositions'

export default {
  name: 'TopPage',
  components: {
    ServiceDescription,
    ProductItems,
    PostItem,
  },
  setup() {
    const { isLoggedIn } = useCurrentUser()

    const products = ref([])
    const fetchProducts = async () => {
      const { data } = await new DefaultApi().fetchProducts(4, 1)

      products.value = data.products
    }
    fetchProducts()

    const posts = ref([])
    const fetchPosts = async () => {
      const { data } = await new DefaultApi().fetchPosts(3, 1)

      posts.value = data.posts
    }
    fetchPosts()

    return {
      isLoggedIn,
      products,
      posts,
    }
  },
}
</script>

<style lang="scss" scoped>
.p-toppage {
  &__products,
  &__posts {
    margin-bottom: 12px
  }
  &__title-annotation {
    font-size: 1.5rem;
    text-align: center;
  }
}
</style>

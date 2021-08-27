<template>
  <div class="p-toppage">
    <cover :is-logged-in="isLoggedIn" />
    <section class="p-toppage__title-container mb-3">
      <h1 class="p-toppage__title text-center mb-3">
        SuppleBoxとは
      </h1>
      <h2 class="p-toppage__title-annotation  text-center mb-2">
        プロテイン選びで失敗したく無い方に向けた、プロテイン特化型の口コミ共有サービスです。
      </h2>
      <ServiceDescription />
    </section>
    <section class="p-toppage__products-container">
      <h2>お気に入りアイテムランキング</h2>
      <ProductItems
        :is-logged-in="isLoggedIn"
        :products="products"
        class="p-toppage__products mb-1"
      />
      <div class="text-center">
        <nuxt-link
          to="/products"
          class="btn btn-success"
        >
          お気に入りアイテムをもっと見る
        </nuxt-link>
      </div>
    </section>
    <section class="p-toppage__posts-container">
      <h2>最新の口コミ</h2>
      <div class="p-toppage__posts mb-1">
        <PostItem
          v-for="post in posts"
          :key="post.id"
          :post="post"
        />
      </div>
      <div class="text-center">
        <nuxt-link
          to="/posts"
          class="btn btn-success"
        >
          最新の口コミをもっと見る
        </nuxt-link>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted } from '@nuxtjs/composition-api'
import { useCurrentUser, useProducts, usePosts } from '@/compositions'

export default defineComponent({
  name: 'TopPage',
  setup () {
    const { isLoggedIn } = useCurrentUser()
    const { products, getProducts } = useProducts()
    const { posts, getPosts } = usePosts()

    onMounted(async () => {
      await getProducts({ per: 4, page: 1 })
      await getPosts({ per: 3, page: 1 })
    })

    return {
      isLoggedIn,
      products,
      posts
    }
  }
})
</script>

<style lang="scss" scoped>
.p-toppage {
}
</style>

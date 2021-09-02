<template>
  <div class="p-post-index">
    <h1 class="text-center">
      最新の口コミ
    </h1>
    <PostItem
      v-for="post in posts"
      :key="post.id"
      :post="post"
    />
    <div class="overflow-auto">
      <b-pagination-nav :link-gen="linkGen" :number-of-pages="totalPages" use-router />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, useRouter } from '@nuxtjs/composition-api'
import { usePosts } from '@/compositions'

export default defineComponent({
  setup () {
    const { posts, totalPages, getPosts } = usePosts()
    const load = async (page = 1) => {
      await getPosts({ per: 8, page })
    }

    onMounted(async () => {
      await load()
    })

    const linkGen = (pageNum: number) => {
      return pageNum === 1 ? '?' : `?page=${pageNum}`
    }

    const router = useRouter()
    router.beforeEach((to, from, next) => {
      if (to.name === 'posts' && from.name === 'posts' && (typeof to.query.page === 'string' || to.query.page === undefined)) {
        load(parseInt(to.query.page, 10) || 1)
        scrollTo(0, 0)
      }
      next()
    })

    return {
      load,
      posts,
      totalPages,
      linkGen
    }
  }
})
</script>

<style lang="scss" scoped>
</style>

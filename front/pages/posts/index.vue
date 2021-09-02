<template>
  <div class="p-post-index">
    <h1 class="text-center">
      最新の口コミ
    </h1>
    <Paginator
      :total-pages="totalPages"
      @page-changed="load($event)"
    />
    <PostItem
      v-for="post in posts"
      :key="post.id"
      :post="post"
    />
    <Paginator
      :total-pages="totalPages"
      @page-changed="load($event)"
    />
    <div class="overflow-auto">
      <b-pagination-nav :link-gen="linkGen" :number-of-pages="totalPages" use-router />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted } from '@nuxtjs/composition-api'
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

<template>
  <div class="p-post-index">
    <h2>最新の口コミ</h2>
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

    return {
      load,
      posts,
      totalPages
    }
  }
})
</script>

<style lang="scss" scoped>
</style>

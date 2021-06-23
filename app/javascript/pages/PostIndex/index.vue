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
import { ref } from "vue";
import PostItem from "@/components/PostItem/index.vue";
import Paginator from "@/components/Paginator/index.vue";
import { DefaultApi } from "@/types/typescript-axios/api";

export default {
  components: {
    PostItem,
    Paginator,
  },
  setup() {
    const posts = ref([]);
    const totalPages = ref(1)

    const load = async(page = 1) => {
      const {data} = await new DefaultApi().fetchPosts(12, page)

      posts.value = data.posts
      totalPages.value = data.total_pages
    }
    load()

    return {
      load,
      posts,
      totalPages
    }
  },
}
</script>

<style lang="scss" scoped>
// .p-post-index {
// }
</style>

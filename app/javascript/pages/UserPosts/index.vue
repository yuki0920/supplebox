<template>
  <div class="p-toppage">
    <div class="p-toppage__posts">
      <PostItem
        v-for="post in posts"
        :key="post.id"
        :post="post"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { ref } from "vue"
import PostItem from "@/components/PostItem/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"

export default {
  name: "UserPosts",
  components: { PostItem },
  setup() {
    const userId = parseInt(location.pathname.split("/").slice(-1)[0])
    const posts = ref([])
    const fetchPosts = async () => {
      const { data } = await new DefaultApi().fetchPosts(24, 1, userId)

      posts.value = data.posts
    }
    fetchPosts()

    return {
      posts,
    }
  },
}
</script>

<style lang="scss" scoped>
</style>

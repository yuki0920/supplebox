<template>
  <div class="p-user-posts col-md-12">
    <UserNav />
    <PostItem
      v-for="post in posts"
      :key="post.id"
      :post="post"
    />
  </div>
</template>

<script lang="ts">
import { ref } from "vue"
import PostItem from "@/components/PostItem/index.vue"
import UserNav from "@/components/UserNav/index.vue"
import { DefaultApi } from "@/types/typescript-axios/api"

export default {
  name: "UserPosts",
  components: { PostItem, UserNav },
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

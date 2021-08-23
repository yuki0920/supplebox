<template>
  <div>
    <UserProfile :is-current-user="isCurrentUser" :user="user" />
    <div class="p-user-posts col-md-12">
      <UserNav />
      <PostItem
        v-for="post in posts"
        :key="post.id"
        :post="post"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { ref, defineComponent, onMounted } from '@nuxtjs/composition-api'
import { useCurrentUser, useUser, usePosts, useId } from '@/compositions'

export default defineComponent({
  name: 'UserPosts',
  setup () {
    const userId = useId()
    const { user } = useUser()
    const { posts, getPosts } = usePosts()
    const { currentUser } = useCurrentUser()
    const isCurrentUser = ref(false)

    onMounted(async () => {
      await getPosts({ user_id: userId })
      isCurrentUser.value = currentUser !== undefined && (userId === currentUser.value?.id)
    })

    return {
      user,
      isCurrentUser,
      posts
    }
  }
})
</script>

<style lang="scss" scoped>
</style>

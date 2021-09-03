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
      <div class="overflow-auto">
        <b-pagination-nav :link-gen="linkGen" :number-of-pages="totalPages" use-router />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref, defineComponent, onMounted, useRouter } from '@nuxtjs/composition-api'
import { useCurrentUser, useUser, usePosts, useId } from '@/compositions'

export default defineComponent({
  name: 'UserPosts',
  setup () {
    const userId = useId()
    const { user } = useUser()
    const { posts, totalPages, getPosts } = usePosts()
    const { currentUser } = useCurrentUser()
    const isCurrentUser = ref(false)

    const load = async (page = 1) => {
      await getPosts({ per: 8, page, user_id: userId })
    }

    onMounted(async () => {
      await load()
      isCurrentUser.value = currentUser !== undefined && (userId === currentUser.value?.id)
    })

    const router = useRouter()
    router.beforeEach((to, from, next) => {
      if (to.name === 'users' && from.name === 'users' && (typeof to.query.page === 'string' || to.query.page === undefined)) {
        load(parseInt(to.query.page, 10) || 1)
        scrollTo(0, 0)
      }
      next()
    })

    const linkGen = (pageNum: number) => {
      return pageNum === 1 ? '?' : `?page=${pageNum}`
    }

    return {
      user,
      isCurrentUser,
      posts,
      totalPages,
      linkGen
    }
  }
})
</script>

<style lang="scss" scoped>
</style>

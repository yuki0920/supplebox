<template>
  <div class="p-product-detail">
    <ProductSummary
      v-if="product !== null"
      :product="product"
      :is-logged-in="isLoggedIn"
    />
    <PostItem
      v-for="postItem in posts"
      :key="postItem.id"
      :post="postItem"
    />
    <FlashMessage
      title="口コミ投稿"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <PostForm
      head="口コミを投稿する"
      :title="post.title"
      :rate="post.rate"
      :content="post.content"
      @change="onChange"
      @submit="submitForm"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted } from '@nuxtjs/composition-api'
import { useCurrentUser, useFlashMessage, usePost, usePosts, useProduct, useId } from '@/compositions'

export default defineComponent({
  name: 'ProductDetail',
  setup () {
    const { isLoggedIn } = useCurrentUser()
    const productId = useId()
    const { fetchProduct, product } = useProduct()
    fetchProduct({ id: productId })

    const { posts, getPosts } = usePosts()

    onMounted(async () => {
      await getPosts({ per: 12, product_id: productId })
    })

    // 口コミ投稿ロジック
    const { post, onChange, createPost } = usePost()
    post.productId = productId
    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await createPost()
        await onFlashMessage({ isSuccess: true })

        // TODO: 投稿リストのDOMに追加する
      } catch (error) {
        await onFlashMessage({ isSuccess: false })
      }
    }

    return {
      isLoggedIn,
      product,
      posts,
      post,
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      onChange,
      submitForm
    }
  }
})
</script>

<style lang='scss' scoped>

</style>

<template>
  <div class="p-product-detail">
    <ProductSummary
      v-if="product !== null"
      :product="product"
      :is-logged-in="isLoggedIn"
    />
    <PostItem
      v-for="post in posts"
      :key="post.id"
      :post="post"
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
import FlashMessage from '@/components/FlashMessage/index.vue'
import ProductSummary from '@/components/ProductSummary/index.vue'
import PostForm from '@/components/PostForm/index.vue'
import PostItem from "@/components/PostItem/index.vue"
import { ref } from 'vue'
import { DefaultApi } from "@/types/typescript-axios/api"
import { useCurrentUser, useFlashMessage, usePost, useProduct } from '@/compositions'

export default {
  name: 'ProductDetail',
  components: { ProductSummary, PostItem, FlashMessage, PostForm },

  setup() {
    const productId = parseInt(location.pathname.split("/").slice(-1)[0])
    const { isLoggedIn } = useCurrentUser()
    const { fetchProduct, product } = useProduct()
    fetchProduct({ id: productId })

    // 口コミ一覧ロジック
    const posts = ref([])
    const fetchPosts = async() => {
      const {data} = await new DefaultApi().fetchPosts(24, 1, undefined, productId)
      posts.value = data.posts
    }
    fetchPosts()

    // 口コミ投稿ロジック
    const { post, onChange, createPost } = usePost()
    post.productId = productId
    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await createPost()
        await onFlashMessage({isSuccess: true})

        location.reload()
      } catch(error) {
        await onFlashMessage({isSuccess: false})
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
}
</script>

<style lang='scss' scoped>

</style>

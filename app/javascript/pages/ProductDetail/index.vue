<template>
  <div class="p-product-detail">
    <ProductSummary
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
      :title="title"
      :rate="rate"
      :content="content"
      @change="onChange"
      @submit="submitForm"
    />
  </div>
</template>

<script lang="ts">
import axios from '@axios'
import FlashMessage from '@/components/FlashMessage/index.vue'
import ProductSummary from '@/components/ProductSummary/index.vue'
import PostForm from '@/components/PostForm/index.vue'
import PostItem from "@/components/PostItem/index.vue"
import { ref } from 'vue'
import { DefaultApi } from "@/types/typescript-axios/api"
import { useCurrentUser, useFlashMessage } from '@/compositions'

export default {
  name: 'ProductDetail',
  components: { ProductSummary, PostItem, FlashMessage, PostForm },

  setup() {
    const { isLoggedIn } = useCurrentUser()

    const productId = parseInt(location.pathname.split("/").slice(-1)[0])

    // 商品取得ロジック
    const product = ref({})
    const fetchProduct = async() => {
      const {data} = await new DefaultApi().fetchProduct(productId)

      product.value = data.product
    }
    fetchProduct()

    // 口コミ一覧ロジック
    const posts = ref([])
    const fetchPosts = async() => {
      const {data} = await new DefaultApi().fetchPosts(24, 1, undefined, productId)
      console.log('data', data)
      posts.value = data.posts
      console.log(posts.value)
    }
    fetchPosts()

    // 口コミ投稿ロジック
    const title = ref('')
    const rate = ref(3)
    const content = ref('')
    let picture

    const onChange = ({type, payload}) => {
      switch(type) {
      case 'title':
        title.value = payload
        break
      case 'rate':
        rate.value = payload
        break
      case 'content':
        content.value = payload
        break
      case 'picture':
        picture = payload
        break
      default:
        break
      }
    }

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      let formData = new FormData()
      formData.append('post[title]', title.value)
      formData.append('post[rate]', `${rate.value}`)
      formData.append('post[content]', content.value)
      formData.append('post[product_id]', String(productId))
      formData.append('post[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.post('/api/posts', formData, config)
        // TODO reloadせずにpostsに追加したい
        location.reload()

        await onFlashMessage({isSuccess: true})
      } catch(error) {
        await onFlashMessage({isSuccess: false})
      }
    }
    return {
      isLoggedIn,
      product,
      posts,
      title,
      rate,
      content,
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

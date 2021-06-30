<template>
  <div class="p-edit-post-form">
    <FlashMessage
      title="口コミ投稿"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <PostForm
      :is-edit="true"
      head="口コミを編集する"
      :post-id="postId"
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
import PostForm from '@/components/PostForm/index.vue'
import { DefaultApi } from '@/types/typescript-axios/api'
import { ref } from 'vue'
import { useFlashMessage } from '@/compositions'

export default {
  name: 'EditPostForm',
  components: { FlashMessage, PostForm },
  setup() {
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
    const postId = location.pathname.split("/").slice(-2)[0]
    let productId: string
    const fetchPost = async (postId) => {
      const { data } = await new DefaultApi().fetchPost(postId)
      title.value = data.post.title
      rate.value = data.post.rate
      content.value = data.post.content
      productId = data.post.product_id
    }
    fetchPost(postId)

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      let formData = new FormData()
      formData.append('post[title]', title.value)
      formData.append('post[rate]', `${rate.value}`)
      formData.append('post[content]', content.value)
      formData.append('post[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.put(`/api/posts/${postId}`, formData, config)
        await onFlashMessage({isShow: true, isSuccess: true})

        location.href = `/products/${productId}`
      } catch(error) {
        onFlashMessage({isShow: true, isSuccess: false})
      }
    }

    return {
      postId,
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

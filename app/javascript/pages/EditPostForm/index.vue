<template>
  <div class="p-edit-post-form">
    <FlashMessage
      :is-display="message.isDisplay"
      :message-text="message.text"
      :message-type="message.type"
      @change="onChange"
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

import { ref, reactive } from 'vue'
export default {
  name: 'EditPostForm',
  components: { FlashMessage, PostForm },
  setup() {
    const message = reactive({
      isDisplay: false,
      text: '',
      type: ''
    })

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

    const fetchPost = async (postId) => {
      const { data } = await new DefaultApi().fetchPost(postId)
      title.value = data.post.title
      rate.value = data.post.rate
      content.value = data.post.content
    }
    fetchPost(postId)

    const submitForm = async () => {
      let formData = new FormData()
      formData.append('post[title]', title.value)
      formData.append('post[rate]', `${rate.value}`)
      formData.append('post[content]', content.value)
      formData.append('post[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.put(`/api/posts/${postId}`, formData, config)

        message.isDisplay = true
        message.text = "口コミを送信しました"
        message.type = "primary"

        location.href = `/products/${postId}`
      } catch(error) {
        const { data } = error.response
        message.isDisplay = true
        message.text = `口コミの送信に失敗しました 「${data.message}」`
        message.type = "danger"
      }
    }

    return {
      postId,
      title,
      rate,
      content,
      message,
      onChange,
      submitForm
    }
  }
}
</script>

<style lang='scss' scoped>
</style>

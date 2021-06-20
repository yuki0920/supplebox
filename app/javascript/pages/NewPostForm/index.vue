<template>
  <div class="o-post-form">
    <FlashMessage
      :is-display="message.isDisplay"
      :message-text="message.text"
      :message-type="message.type"
      @change="onChange"
    />
    <PostForm
      head="口コミを投稿する"
      :title="title"
      :rate="rate"
      :content="content"
      @change="onChange"
      @submitForm="submitForm"
    />
  </div>
</template>

<script lang="ts">
import axios from '@axios'
import FlashMessage from '@/components/FlashMessage/index.vue'
import PostForm from '@/components/PostForm/index.vue'

import { ref, reactive } from 'vue'
export default {
  name: 'NewPostForm',
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
    const submitForm = async () => {
      const productId = location.pathname.split("/").slice(-1)[0]
      let formData = new FormData()
      formData.append('posts[title]', title.value)
      formData.append('posts[rate]', `${rate.value}`)
      formData.append('posts[content]', content.value)
      formData.append('posts[product_id]', productId)
      formData.append('posts[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.post('/api/posts', formData, config)

        message.isDisplay = true
        message.text = "口コミを送信しました"
        message.type = "primary"

        location.reload()
      } catch(error) {
        const { data } = error.response
        message.isDisplay = true
        message.text = `口コミの送信に失敗しました 「${data.message}」`
        message.type = "danger"
      }
    }
    return {
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
.o-post-form {
  &__radio {
    margin-left: 16px;
  }
}
</style>

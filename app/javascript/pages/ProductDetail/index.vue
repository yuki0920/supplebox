<template>
  <div class="p-product-detail">
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
      @submit="submitForm"
    />
  </div>
</template>

<script lang="ts">
import axios from '@axios'
import FlashMessage from '@/components/FlashMessage/index.vue'
import PostForm from '@/components/PostForm/index.vue'

import { ref, reactive } from 'vue'
export default {
  name: 'ProductDetail',
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
      formData.append('post[title]', title.value)
      formData.append('post[rate]', `${rate.value}`)
      formData.append('post[content]', content.value)
      formData.append('post[product_id]', productId)
      formData.append('post[picture]', picture)
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

</style>

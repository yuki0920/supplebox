<template>
  <div class="p-edit-post-form">
    <FlashMessage
      title="口コミ編集"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <PostForm
      :is-edit="true"
      head="口コミを編集する"
      :title="post.title"
      :rate="post.rate"
      :content="post.content"
      @change="onChange"
      @submit="submitForm"
      @deletePost="deletePost({ id: postId })"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, useRouter } from '@nuxtjs/composition-api'
import FlashMessage from '@/components/FlashMessage/index.vue'
import PostForm from '@/components/PostForm/index.vue'
import { useFlashMessage, usePost, useId } from '@/compositions'

export default defineComponent({
  name: 'EditPostForm',
  components: { FlashMessage, PostForm },
  setup () {
    const router = useRouter()
    const postId = useId()
    const { post, onChange, getPost, updatePost, deletePost } = usePost()

    onMounted(async () => {
      await getPost({ id: postId })
    })

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await updatePost({ id: postId })
        await onFlashMessage({ isSuccess: true })

        router.push(`/products/${post.productId}`)
      } catch (error) {
        await onFlashMessage({ isSuccess: false })
      }
    }

    return {
      postId,
      post,
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      onChange,
      submitForm,
      deletePost
    }
  }
})
</script>

<style lang='scss' scoped>
</style>

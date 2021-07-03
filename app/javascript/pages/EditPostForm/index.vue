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
      @deletePost="deletePost({ id: postId})"
    />
  </div>
</template>

<script lang="ts">
import FlashMessage from '@/components/FlashMessage/index.vue'
import PostForm from '@/components/PostForm/index.vue'
import { useFlashMessage, usePost } from '@/compositions'

export default {
  name: 'EditPostForm',
  components: { FlashMessage, PostForm },
  setup() {
    const postId: number = parseInt(location.pathname.split("/").slice(-2)[0])
    const { post, onChange, fetchPost, updatePost, deletePost } = usePost()

    fetchPost({ id: postId })

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await updatePost({ id: postId })
        await onFlashMessage({isSuccess: true})

        location.href = `/products/${post.productId}`
      } catch(error) {
        await onFlashMessage({isSuccess: false})
      }
    }

    return {
      post,
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      onChange,
      submitForm,
      deletePost,
    }
  }
}
</script>

<style lang='scss' scoped>
</style>

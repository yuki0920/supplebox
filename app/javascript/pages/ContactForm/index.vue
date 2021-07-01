<template>
  <div class="contact">
    <FlashMessage
      title="お問い合わせ"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <h1>お問い合わせ</h1>
    <p>お気軽にお問い合わせください!</p>
    <form @submit.prevent="submitForm">
      <div class="form-group row">
        <label
          for="contact_name"
          class="col-sm-3 col-form-label"
        >お名前</label>
        <input
          id="contact_name"
          v-model="formData.name"
          type="text"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_email"
          class="col-sm-3 col-form-label"
        >メールアドレス</label>
        <input
          id="contact_email"
          v-model="formData.email"
          type="email"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_title"
          class="col-sm-3 col-form-label"
        >タイトル</label>
        <input
          id="contact_title"
          v-model="formData.title"
          type="text"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_content"
          class="col-sm-3 col-form-label"
        >お問い合わせ内容</label>
        <textarea
          id="contact_content"
          v-model="formData.content"
          class="col-sm-9 form-control"
          rows="3"
        />
      </div>

      <div class="form-group row justify-content-end">
        <div class="col-sm-9">
          <button
            type="submit"
            class="btn btn-success"
          >
            送信する
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import { reactive } from 'vue'
import { useFlashMessage } from '@/compositions'
import FlashMessage from '@/components/FlashMessage/index.vue'
import { DefaultApi } from '@/types/typescript-axios/api'

export default {
  name: 'ContactForm',
  components: { FlashMessage },
  setup() {
    const formData = reactive(
      {
        name: "",
        email: "",
        title: "",
        content: ""
      }
    )

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await new DefaultApi().postContact({
          contacts: {
            name: formData.name,
            email: formData.email,
            title: formData.title,
            content: formData.content,
          }
        })
        await onFlashMessage({isSuccess: true})
      } catch(error) {
        await onFlashMessage({isSuccess: false})
      }
    }

    return {
      formData,
      submitForm,
      messageIsShow,
      messageIsSuccess,
      onFlashMessage
    }
  }
}
</script>

<style scoped>
p {
  font-size: 1em;
  text-align: center;
}
</style>

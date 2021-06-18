<template>
  <div class="contact">
    <FlashMessage
      :is-display="message.isDisplay"
      :message-text="message.text"
      :message-type="message.type"
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
import FlashMessage from '../FlashMessage/index.vue'
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
    const message = reactive({
      isDisplay: false,
      text: "",
      type: ""
    })
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
          message.isDisplay = true
          message.text = "お問い合わせを送信しました"
          message.type = "primary"
      } catch(error) {
        const { data } = error.response
          message.isDisplay = true
          message.text = `お問い合わせの送信に失敗しました 「${data.message}」`
          message.type = "danger"
      }
    }
    return {
      message,
      formData,
      submitForm
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

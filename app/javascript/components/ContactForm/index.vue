<template>
  <div class="contact">
    <h1>お問い合わせ</h1>
    <p>お気軽にお問い合わせください!</p>
    <form>
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
            @submit="submit"
          >
            送信する
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script lang='ts'>
import { ref, reactive } from 'vue'
import axios from 'axios'


export default {
  name: 'ContactForm',
  setup() {
    const message = ref('Hello World')
    const formData = reactive(
      {
        name: "",
        email: "",
        title: "",
        content: ""
      }
    )
    const submitForm = async () => {
      try {
        await axios.post('/api/contacts', formData )
      } catch(error) {
        const { message } = error.response.data
        console.log(message)
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

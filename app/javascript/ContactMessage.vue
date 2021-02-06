<template>
  <div id="app">
    <h1>お問い合わせ</h1>
    <p>お気軽にお問い合わせください!</p>
    <form>
      <div class="form-group row">
        <label for="contact_name" class="col-sm-3 col-form-label">お名前</label>
        <div class="col-sm-9">
          <input v-model="formData.name" type="text" class="form-control" id="contact_name">
        </div>
      </div>
      <div class="form-group row">
        <label for="contact_email" class="col-sm-3 col-form-label">メールアドレス</label>
        <div class="col-sm-9">
          <input v-model="formData.email" type="email" class="form-control" id="contact_email">
        </div>
      </div>
      <div class="form-group row">
        <label for="contact_title" class="col-sm-3 col-form-label">タイトル</label>
        <div class="col-sm-9">
          <input v-model="formData.title" type="text" class="form-control" id="contact_title">
        </div>
      </div>
      <div class="form-group row">
        <label for="contact_content" class="col-sm-3 col-form-label">お問い合わせ内容</label>
        <div class="col-sm-9">
          <textarea v-model="formData.content" class="form-control" id="contact_content" rows="3"></textarea>
        </div>
      </div>
      <div class="form-group row justify-content-end">
        <div class="col-sm-9">
          <button type="submit" class="btn btn-success" @click="submitForm">送信する</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
const addCsrfToken = () => {
  axios.defaults.headers.common = {
    "X-Requested-With": "XMLHttpRequest",
    "X-CSRF-TOKEN": document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content"),
  }
}
export default {
  mounted() {
    addCsrfToken()
  },
  data() {
    return {
      formData: {
        name: "",
        email: "",
        title: "",
        content: ""
      }
    }
  },
  methods: {
    submitForm() {
      axios.post('/contacts', this.formData )
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

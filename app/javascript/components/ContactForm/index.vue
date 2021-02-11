<template>
  <div class="contact">
    <h1>お問い合わせ</h1>
    <p>お気軽にお問い合わせください!</p>
    <ValidationObserver v-slot="{ handleSubmit }">
      <form @submit="handleSubmit(submitForm)">
        <div class="form-group row">
          <label for="contact_name" class="col-sm-3 col-form-label">お名前</label>
          <ValidationProvider v-slot="{ errors }" rules="required" name="お名前" class="col-sm-9">
            <input v-model="formData.name" type="text" class="form-control" id="contact_name">
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label for="contact_email" class="col-sm-3 col-form-label">メールアドレス</label>
          <ValidationProvider v-slot="{ errors }" rules="required|email" name="メールアドレス" class="col-sm-9">
            <input v-model="formData.email" type="email" class="form-control" id="contact_email">
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label for="contact_title" class="col-sm-3 col-form-label">タイトル</label>
          <ValidationProvider v-slot="{ errors }" rules="required" name="タイトル" class="col-sm-9">
            <input v-model="formData.title" type="text" class="form-control" id="contact_title">
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label for="contact_content" class="col-sm-3 col-form-label">お問い合わせ内容</label>
          <ValidationProvider v-slot="{ errors }" rules="required" name="お問い合わせ内容" class="col-sm-9">
            <textarea v-model="formData.content" class="form-control" id="contact_content" rows="3"></textarea>
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group row justify-content-end">
          <div class="col-sm-9">
            <button type="submit" class="btn btn-success">送信する</button>
          </div>
        </div>
      </form>
    </ValidationObserver>
  </div>
</template>

<script>
import { extend, localize, ValidationObserver, ValidationProvider } from 'vee-validate'
import { required, email } from 'vee-validate/dist/rules'
import ja from 'vee-validate/dist/locale/ja.json'

// バリデーションルール
extend('required', required);
extend('email', email);

// メッセージのローカライズ
localize('ja', ja);

// axios
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
  components: {
    ValidationObserver,
    ValidationProvider
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
      addCsrfToken()

      axios.post('/contacts', this.formData )
    }
  }
}
</script>

<style scoped>
[v-cloak] {
  display:none;
}

p {
  font-size: 1em;
  text-align: center;
}
</style>

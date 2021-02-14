<template>
  <div class="contact">
    <FlashMessage
      :is-display="outputMessage"
      :message-text="messageText"
      :message-type="messageType"
    />
    <h1>お問い合わせ</h1>
    <p>お気軽にお問い合わせください!</p>
    <ValidationObserver v-slot="{ handleSubmit, invalid }">
      <form @submit.prevent="handleSubmit(submitForm)">
        <div class="form-group row">
          <label
            for="contact_name"
            class="col-sm-3 col-form-label"
          >お名前</label>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
            name="お名前"
            class="col-sm-9"
          >
            <input
              v-model="formData.name"
              type="text"
              class="form-control"
              id="contact_name"
            >
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label
            for="contact_email"
            class="col-sm-3 col-form-label"
          >メールアドレス</label>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|email"
            name="メールアドレス"
            class="col-sm-9"
          >
            <input
              v-model="formData.email"
              type="email"
              class="form-control"
              id="contact_email"
            >
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label
            for="contact_title"
            class="col-sm-3 col-form-label"
          >タイトル</label>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
            name="タイトル"
            class="col-sm-9"
          >
            <input
              v-model="formData.title"
              type="text"
              class="form-control"
              id="contact_title"
            >
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="form-group row">
          <label
            for="contact_content"
            class="col-sm-3 col-form-label"
          >お問い合わせ内容</label>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
            name="お問い合わせ内容"
            class="col-sm-9"
          >
            <textarea
              v-model="formData.content"
              class="form-control"
              id="contact_content"
              rows="3"
            />
            <span class="error text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group row justify-content-end">
          <div class="col-sm-9">
            <button
              :disabled="invalid"
              type="submit"
              class="btn btn-success"
            >
              送信する
            </button>
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
import FlashMessage from '../FlashMessage'
import axios from '@axios'
import { mapState, mapMutations } from 'vuex'
extend('required', required);
extend('email', email);
localize('ja', ja);
console.log(process.env.NODE_ENV)

export default {
  components: {
    FlashMessage,
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
      },
    }
  },
  computed: {
    ...mapState(["messageText", "messageType", "outputMessage"])
  },
  methods: {
    ...mapMutations(["setMessage"]),
    async submitForm() {
      try {
        await axios.post('/api/contacts', this.formData )
        this.setMessage({text: "お問い合わせを送信しました", type: "primary"})
      } catch(error) {
        const { message } = error.response.data
        this.setMessage({text: `お問い合わせの送信に失敗しました 「${message}」`, type: "danger"})
      }
    },
  }
}
</script>

<style scoped>
p {
  font-size: 1em;
  text-align: center;
}
</style>

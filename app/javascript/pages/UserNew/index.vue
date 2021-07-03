<template>
  <div class="p-user-new">
    <div class="row justify-content-center">
      <div class="col-xs-offset-2 col-xs-8 col-md-offset-3 col-md-6">
        <div class="card">
          <div class="card-header">
            新規登録
          </div>
          <div class="card-body">
            <form @submit.prevent="submitForm">
              <div class="form-group">
                <label for="user_name">ユーザー名</label>
                <input
                  id="user_name"
                  v-model="name"
                  class="form-control"
                  type="text"
                  name="user[name]"
                >
              </div>
              <div class="form-group">
                <label for="user_email">メールアドレス</label>
                <input
                  id="user_email"
                  v-model="email"
                  class="form-control"
                  type="email"
                  name="user[email]"
                >
              </div>
              <div class="form-group">
                <label for="user_password">パスワード</label>
                <input
                  id="user_password"
                  v-model="password"
                  class="form-control"
                  type="password"
                  name="user[password]"
                >
              </div>
              <div class="form-group">
                <label for="user_password_confirmation">パスワード(確認)</label>
                <input
                  id="user_password_confirmation"
                  v-model="password_confirmation"
                  class="form-control"
                  type="password"
                  name="user[password_confirmation]"
                >
              </div>
              <div>
                <input
                  type="submit"
                  value="登録する"
                  class="btn btn-success btn-block"
                  data-disable-with="登録する"
                >
              </div>
            </form><p>
              アカウントをお持ちの方はこちらから<a href="/login">ログイン</a>してください
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import { DefaultApi } from '@/types/typescript-axios/api'

export default {
  name: 'UserNew',
  setup() {
    const name = ref('')
    const email = ref('')
    const password = ref('')
    const password_confirmation = ref('')

    const submitForm = async() => {
      const {data}  = await new DefaultApi().createUser({
        user: {
          name: name.value,
          email: email.value,
          password: password.value,
          password_confirmation: password_confirmation.value
        }
      })

      location.href = `/users/${data.user.id}`
    }
    return {
      name,
      email,
      password,
      password_confirmation,
      submitForm,
    }
  }
}
</script>

<style lang='scss' scoped>
</style>

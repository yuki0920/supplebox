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
                  v-model="user.name"
                  class="form-control"
                  type="text"
                  name="user[name]"
                >
              </div>
              <div class="form-group">
                <label for="user_email">メールアドレス</label>
                <input
                  id="user_email"
                  v-model="user.email"
                  class="form-control"
                  type="email"
                  name="user[email]"
                >
              </div>
              <div class="form-group">
                <label for="user_password">パスワード</label>
                <input
                  id="user_password"
                  v-model="user.password"
                  class="form-control"
                  type="password"
                  name="user[password]"
                >
              </div>
              <div class="form-group">
                <label for="user_password_confirmation">パスワード(確認)</label>
                <input
                  id="user_password_confirmation"
                  v-model="user.password_confirmation"
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
import { defineComponent, reactive, useContext, useRouter } from '@nuxtjs/composition-api'
import { CreateUserParamsResource } from '@/types/typescript-axios/api'

export default defineComponent({
  name: 'UserNew',
  setup () {
    const router = useRouter()
    const { $axios } = useContext()
    const user = reactive<CreateUserParamsResource>({ name: '', email: '', password: '', password_confirmation: '' })

    const submitForm = async () => {
      const { data } = await $axios.post('/api/users', {
        user: {
          name: user.name,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      })

      router.push(`/users/${data.user.id}`)
    }
    return {
      user,
      submitForm
    }
  }
})
</script>

<style lang='scss' scoped>
</style>

<template>
  <div class="p-login">
    <FlashMessage
      title="ログイン"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <div class="p-login row justify-content-center">
      <div class="col-xs-offset-2 col-xs-8 col-md-offset-3 col-md-6">
        <div class="card">
          <div class="card-header">
            ログイン
          </div>
          <div class="card-body">
            <form @submit.prevent="submitForm">
              <div class="form-group">
                <label for="session_email">メールアドレス</label>
                <input
                  id="session_email"
                  v-model="email"
                  class="form-control"
                  type="email"
                  name="session[email]"
                >
              </div>
              <div class="form-group">
                <label for="session_password">パスワード</label>
                <input
                  id="session_password"
                  v-model="password"
                  class="form-control"
                  type="password"
                  name="session[password]"
                >
              </div>
              <div class="login">
                <input
                  type="submit"
                  value="ログイン"
                  class="btn btn-success btn-block"
                >
              </div>
            </form><p>
              アカウントをお持ちでない方はこちらから<a href="/signup">新規登録</a>してください
              <br>
              試しに使ってみたい方は
              <a
                href="javascript:void(0)"
                @click="loginAsTestUser"
              >
                テストアカウント
              </a>
              をお使いください
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import FlashMessage from '@/components/FlashMessage/index.vue'
import { DefaultApi } from '@/types/typescript-axios/api'
import { useFlashMessage, useSessions } from '@/compositions'
export default {
  name: 'Login',
  components: { FlashMessage },
  setup() {
    const email = ref('')
    const password = ref('')

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()

    const submitForm = async() => {
      try {
        const {data}  = await new DefaultApi().login({
          session: { email: email.value, password: password.value}
        })

        onFlashMessage({ isSuccess: true})
        location.href = `/users/${data.user.id}`
      } catch(error) {
        onFlashMessage({ isSuccess: false})
      }
    }

    const { loginAsTestUser } = useSessions()

    return {
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      email,
      password,
      submitForm,
      loginAsTestUser,
    }
  }
}
</script>

<style lang='scss' scoped>
</style>
